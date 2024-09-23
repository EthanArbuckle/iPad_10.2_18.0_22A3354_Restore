@implementation AXMIDIParser

- (id)parse:(const MIDIPacketList *)a3 error:(id *)a4
{
  AXMIDIEvent *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v20;
  void *v21;
  __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(AXMIDIEvent);
  if (a3->numPackets != 1)
  {
    if (!a3->numPackets)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = AXMIDIErrorDomain;
      v31 = *MEMORY[0x1E0CB2D50];
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Received 0 packets"));
      v32[0] = v10;
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = (void **)v32;
      v13 = &v31;
LABEL_9:
      objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 7, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_20:
    v18 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_13;
  }
  if (!a3->packet[0].length)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = AXMIDIErrorDomain;
    v29 = *MEMORY[0x1E0CB2D50];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Received 0-length packet"));
    v30 = v10;
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v30;
    v13 = &v29;
    goto LABEL_9;
  }
  v14 = a3->packet[0].data[0];
  -[AXMIDIEvent setChannel:](v7, "setChannel:", -[AXMIDIParser _channelForStatusByte:](self, "_channelForStatusByte:", v14));
  -[AXMIDIEvent setType:](v7, "setType:", -[AXMIDIParser _eventTypeForStatusByte:](self, "_eventTypeForStatusByte:", v14));
  v15 = -[AXMIDIParser _expectedPacketLengthForEventType:](self, "_expectedPacketLengthForEventType:", -[AXMIDIEvent type](v7, "type"));
  if (v15 == a3->packet[0].length)
  {
    switch(-[AXMIDIEvent type](v7, "type"))
    {
      case 1:
      case 2:
      case 3:
        -[AXMIDIEvent setNote:](v7, "setNote:", a3->packet[0].data[1]);
        v16 = a3->packet[0].data[2];
        goto LABEL_19;
      case 4:
        -[AXMIDIEvent setControl:](v7, "setControl:", a3->packet[0].data[1]);
        -[AXMIDIEvent setControlValue:](v7, "setControlValue:", a3->packet[0].data[2]);
        break;
      case 5:
        -[AXMIDIEvent setProgram:](v7, "setProgram:", a3->packet[0].data[1]);
        break;
      case 6:
        v16 = a3->packet[0].data[1];
LABEL_19:
        -[AXMIDIEvent setPressure:](v7, "setPressure:", v16);
        break;
      case 7:
        -[AXMIDIEvent setPitchBend:](v7, "setPitchBend:", a3->packet[0].data[1] | (a3->packet[0].data[2] << 7));
        break;
      default:
        goto LABEL_20;
    }
    goto LABEL_20;
  }
  v20 = v15;
  v21 = (void *)MEMORY[0x1E0CB35C8];
  v22 = AXMIDIErrorDomain;
  v27 = *MEMORY[0x1E0CB2D50];
  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", a3->packet[0].length);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AXMIDIEvent type](v7, "type"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("Expected packet to be %@ bytes, was actually %@ bytes. type: %@"), v10, v17, v24, v27);
  v28 = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 7, v26);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (v18)
  {

    v7 = 0;
  }
  if (a4)
LABEL_13:
    *a4 = objc_retainAutorelease(v18);
LABEL_14:

  return v7;
}

- (int64_t)_eventTypeForStatusByte:(unsigned __int8)a3
{
  unsigned int v3;

  v3 = (a3 >> 4) ^ 8;
  if (v3 < 7 && ((0x7Bu >> v3) & 1) != 0)
    return qword_18C737140[v3];
  else
    return 8 * (a3 > 0xEFu);
}

- (unint64_t)_expectedPacketLengthForEventType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7)
    return 0;
  else
    return qword_18C737178[a3 - 1];
}

- (unsigned)_channelForStatusByte:(unsigned __int8)a3
{
  if ((a3 & 0xF) == 0xF)
    return 0x8000;
  else
    return word_18C7371B8[a3 & 0xF];
}

@end
