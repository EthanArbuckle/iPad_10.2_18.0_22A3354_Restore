@implementation CBUUID

+ (CBUUID)UUIDWithData:(NSData *)theData
{
  NSData *v3;
  CBUUID *v4;

  v3 = theData;
  v4 = -[CBUUID initWithData:]([CBUUID alloc], "initWithData:", v3);

  return v4;
}

- (CBUUID)initWithData:(id)a3
{
  id v5;
  char *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CBUUID;
  v6 = -[CBUUID init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "length");
    switch(v7)
    {
      case 16:
        objc_msgSend(v5, "getBytes:length:", v6 + 8, 16);
        v6[24] = 2;
        break;
      case 4:
        *(_OWORD *)(v6 + 8) = CBBluetoothBaseUUIDData;
        objc_msgSend(v5, "getBytes:length:", v6 + 8, 4);
        v6[24] = 1;
        break;
      case 2:
        *(_OWORD *)(v6 + 8) = CBBluetoothBaseUUIDData;
        objc_msgSend(v5, "getBytes:length:", v6 + 10, 2);
        v6[24] = 0;
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("CBUUID.m"), 348, CFSTR("Data %@ does not represent a valid UUID"), v5);

        break;
    }
  }

  return (CBUUID *)v6;
}

+ (CBUUID)UUIDWithString:(NSString *)theString
{
  NSString *v3;
  CBUUID *v4;

  v3 = theString;
  v4 = -[CBUUID initWithString:]([CBUUID alloc], "initWithString:", v3);

  return v4;
}

- (CBUUID)initWithString:(id)a3 safe:(BOOL)a4
{
  id v7;
  CBUUID *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  CBUUID *v15;
  void *v16;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CBUUID;
  v8 = -[CBUUID init](&v18, sel_init);
  if (!v8)
    goto LABEL_19;
  if (objc_msgSend(v7, "compare:options:range:", CFSTR("0x"), 1, 0, 2))
  {
    v9 = v7;
    v10 = objc_msgSend(v9, "length");
    if (v10 != 36)
      goto LABEL_4;
LABEL_9:
    v8->_type = 2;
    v12 = objc_retainAutorelease(v9);
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    if (!v13)
      goto LABEL_15;
    goto LABEL_14;
  }
  objc_msgSend(v7, "substringFromIndex:", 2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");
  if (v10 == 36)
    goto LABEL_9;
LABEL_4:
  if (v10 == 8)
  {
    objc_msgSend(CFSTR("00000000-0000-1000-8000-00805F9B34FB"), "stringByReplacingCharactersInRange:withString:", 0, 8, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v8->_type = 1;
    v12 = objc_retainAutorelease(v14);
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    if (!v13)
      goto LABEL_15;
  }
  else if (v10 == 4)
  {
    objc_msgSend(CFSTR("00000000-0000-1000-8000-00805F9B34FB"), "stringByReplacingCharactersInRange:withString:", 4, 4, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v8->_type = 0;
    v12 = objc_retainAutorelease(v11);
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    if (!v13)
      goto LABEL_15;
  }
  else
  {

    v12 = objc_retainAutorelease(0);
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    if (!v13)
      goto LABEL_15;
  }
LABEL_14:
  if (!uuid_parse(v13, v8->_bytes))
  {
LABEL_18:

LABEL_19:
    v15 = v8;
    goto LABEL_20;
  }
LABEL_15:
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("CBUUID.m"), 321, CFSTR("String %@ does not represent a valid UUID"), v7);

    goto LABEL_18;
  }

  v15 = 0;
LABEL_20:

  return v15;
}

- (CBUUID)initWithString:(id)a3
{
  return -[CBUUID initWithString:safe:](self, "initWithString:safe:", a3, 0);
}

- (NSData)data
{
  unint64_t type;

  type = self->_type;
  if (type > 2)
    return (NSData *)0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", (char *)self + qword_1A8335460[type], qword_1A8335478[type], 0);
  return (NSData *)(id)objc_claimAutoreleasedReturnValue();
}

- (CBUUID)initWithCFUUID:(__CFUUID *)a3
{
  char *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBUUID;
  v4 = -[CBUUID init](&v6, sel_init);
  if (v4)
  {
    *(CFUUIDBytes *)(v4 + 8) = CFUUIDGetUUIDBytes(a3);
    v4[24] = 2;
  }
  return (CBUUID *)v4;
}

- (CBUUID)initWithNSUUID:(id)a3
{
  id v4;
  CBUUID *v5;
  CBUUID *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CBUUID;
  v5 = -[CBUUID init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v4, "getUUIDBytes:", v5->_bytes);
    v6->_type = 2;
  }

  return v6;
}

+ (CBUUID)UUIDWithCFUUID:(CFUUIDRef)theUUID
{
  return -[CBUUID initWithCFUUID:]([CBUUID alloc], "initWithCFUUID:", theUUID);
}

+ (CBUUID)UUIDWithNSUUID:(NSUUID *)theUUID
{
  NSUUID *v3;
  CBUUID *v4;

  v3 = theUUID;
  v4 = -[CBUUID initWithNSUUID:]([CBUUID alloc], "initWithNSUUID:", v3);

  return v4;
}

- (NSString)UUIDString
{
  int type;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  char out[40];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  type = self->_type;
  if (type == 2)
  {
    memset(out, 0, 37);
    uuid_unparse_upper(self->_bytes, out);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", out);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (type == 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X%02X%02X"), self->_bytes[0], self->_bytes[1], self->_bytes[2], self->_bytes[3]);
    }
    else
    {
      if (self->_type)
      {
        v3 = 0;
        return (NSString *)v3;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02X%02X"), self->_bytes[2], self->_bytes[3], v5, v6);
    }
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = *(_QWORD *)self->_bytes == v4[1] && *(_QWORD *)&self->_bytes[8] == v4[2];

    return v6;
  }
  else
  {

    return 0;
  }
}

- (unint64_t)hash
{
  return *(_QWORD *)&self->_bytes[8] ^ *(_QWORD *)self->_bytes;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (qword_1ECF9A220 != -1)
    dispatch_once(&qword_1ECF9A220, &__block_literal_global_2);
  -[CBUUID UUIDString](self, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_1, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = v3;
  v6 = v4;

  return v6;
}

void __21__CBUUID_description__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[107];
  _QWORD v3[108];

  v3[107] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("1800");
  v2[1] = CFSTR("1801");
  v3[0] = CFSTR("Generic Access Profile");
  v3[1] = CFSTR("Generic Attribute Profile");
  v2[2] = CFSTR("2900");
  v2[3] = CFSTR("2901");
  v3[2] = CFSTR("Characteristic Extended Properties");
  v3[3] = CFSTR("Characteristic User Description");
  v2[4] = CFSTR("2902");
  v2[5] = CFSTR("2903");
  v3[4] = CFSTR("Client Characteristic Configuration");
  v3[5] = CFSTR("Server Characteristic Configuration");
  v2[6] = CFSTR("2904");
  v2[7] = CFSTR("2905");
  v3[6] = CFSTR("Characteristic Format");
  v3[7] = CFSTR("Characteristic Aggregate Format");
  v2[8] = CFSTR("2A00");
  v2[9] = CFSTR("2A01");
  v3[8] = CFSTR("Device Name");
  v3[9] = CFSTR("Appearence");
  v2[10] = CFSTR("2A02");
  v2[11] = CFSTR("2A03");
  v3[10] = CFSTR("Peripheral Privacy Flag");
  v3[11] = CFSTR("Reconnection Address");
  v2[12] = CFSTR("2A04");
  v2[13] = CFSTR("2A05");
  v3[12] = CFSTR("Peripheral Preferred Connection Parameters");
  v3[13] = CFSTR("Service Changed");
  v2[14] = CFSTR("1805");
  v2[15] = CFSTR("2A2B");
  v3[14] = CFSTR("Current Time");
  v3[15] = CFSTR("Current Time");
  v2[16] = CFSTR("2A0F");
  v2[17] = CFSTR("180A");
  v3[16] = CFSTR("Local Time Information");
  v3[17] = CFSTR("Device Information");
  v2[18] = CFSTR("2A29");
  v2[19] = CFSTR("2A24");
  v3[18] = CFSTR("Manufacturer Name String");
  v3[19] = CFSTR("Model Number String");
  v2[20] = CFSTR("2A25");
  v2[21] = CFSTR("2A27");
  v3[20] = CFSTR("Serial Number String");
  v3[21] = CFSTR("Hardware Revision String");
  v2[22] = CFSTR("2A26");
  v2[23] = CFSTR("2A28");
  v3[22] = CFSTR("Firmware Revision String");
  v3[23] = CFSTR("Software Revision String");
  v2[24] = CFSTR("2A23");
  v2[25] = CFSTR("2A2A");
  v3[24] = CFSTR("System ID");
  v3[25] = CFSTR("IEEE Regulatory Certification");
  v2[26] = CFSTR("2A50");
  v2[27] = CFSTR("2BFF");
  v3[26] = CFSTR("PnP ID");
  v3[27] = CFSTR("UDI For Medical Device");
  v2[28] = CFSTR("180F");
  v2[29] = CFSTR("2A19");
  v3[28] = CFSTR("Battery");
  v3[29] = CFSTR("Battery Level");
  v2[30] = CFSTR("2A1A");
  v2[31] = CFSTR("1812");
  v3[30] = CFSTR("Battery Power State");
  v3[31] = CFSTR("Human Interface Device");
  v2[32] = CFSTR("2A4E");
  v2[33] = CFSTR("2A4D");
  v3[32] = CFSTR("Protocol Mode");
  v3[33] = CFSTR("Report");
  v2[34] = CFSTR("2A4B");
  v2[35] = CFSTR("2A22");
  v3[34] = CFSTR("Report Map");
  v3[35] = CFSTR("Boot Keyboard Input Report");
  v2[36] = CFSTR("2A32");
  v2[37] = CFSTR("2A33");
  v3[36] = CFSTR("Boot Keyboard Output Report");
  v3[37] = CFSTR("Boot Mouse Input Report");
  v2[38] = CFSTR("2A4A");
  v2[39] = CFSTR("2A4C");
  v3[38] = CFSTR("HID Information");
  v3[39] = CFSTR("HID Control Point");
  v2[40] = CFSTR("2908");
  v2[41] = CFSTR("7905F431-B5CE-4E99-A40F-4B1E122D00D0");
  v3[40] = CFSTR("Report Reference");
  v3[41] = CFSTR("Apple Notification Center");
  v2[42] = CFSTR("69D1D8F3-45E1-49A8-9821-9BBDFDAAD9D9");
  v2[43] = CFSTR("9FBF120D-6301-42D9-8C58-25E699A21DBD");
  v3[42] = CFSTR("ANCS Control Point");
  v3[43] = CFSTR("ANCS Notification Source");
  v2[44] = CFSTR("22EAC6E9-24D6-4BB5-BE44-B36ACE7C7BFB");
  v2[45] = CFSTR("89D3502B-0F36-433A-8EF4-C502AD55F8DC");
  v3[44] = CFSTR("ANCS Data Source");
  v3[45] = CFSTR("Apple Media");
  v2[46] = CFSTR("9B3C81D8-57B1-4A8A-B8DF-0E56F7CA51C2");
  v2[47] = CFSTR("2F7CABCE-808D-411F-9A0C-BB92BA96C102");
  v3[46] = CFSTR("AMS Remote Command");
  v3[47] = CFSTR("AMS Entity Update");
  v2[48] = CFSTR("C6B2F38C-23AB-46D8-A6AB-A3A870BBD5D7");
  v2[49] = CFSTR("4715650B-5E9D-4AC2-B898-A4FC0AA5DF78");
  v3[48] = CFSTR("AMS Entity Attribute");
  v3[49] = CFSTR("Unified Accessory Restore");
  v2[50] = CFSTR("94110001-6D9B-4225-A4F1-6A4A7F01B0DE");
  v2[51] = CFSTR("1810");
  v3[50] = CFSTR("UARP Data Control Point");
  v3[51] = CFSTR("Blood Pressure");
  v2[52] = CFSTR("1816");
  v2[53] = CFSTR("1814");
  v3[52] = CFSTR("Cycling Speed and Cadence");
  v3[53] = CFSTR("Running Speed and Cadence");
  v2[54] = CFSTR("1818");
  v2[55] = CFSTR("1808");
  v3[54] = CFSTR("Cycling Power");
  v3[55] = CFSTR("Glucose");
  v2[56] = CFSTR("1809");
  v2[57] = CFSTR("180D");
  v3[56] = CFSTR("Health Thermometer");
  v3[57] = CFSTR("Heart Rate");
  v2[58] = CFSTR("181B");
  v2[59] = CFSTR("181D");
  v3[58] = CFSTR("Body Composition");
  v3[59] = CFSTR("Weight Scale");
  v2[60] = CFSTR("181F");
  v2[61] = CFSTR("1822");
  v3[60] = CFSTR("Continuous Glucose Monitoring");
  v3[61] = CFSTR("Pulse Oximeter");
  v2[62] = CFSTR("183A");
  v2[63] = CFSTR("183E");
  v3[62] = CFSTR("Insulin Delivery");
  v3[63] = CFSTR("Physical Activity Monitor");
  v2[64] = CFSTR("1840");
  v3[64] = CFSTR("Generic Health Sensor");
  v2[65] = CFSTR("2BF3");
  v3[65] = CFSTR("Health Sensor Features");
  v2[66] = CFSTR("2B8B");
  v3[66] = CFSTR("Live Health Observations");
  v2[67] = CFSTR("2BDD");
  v3[67] = CFSTR("Stored Health Observations");
  v2[68] = CFSTR("2A52");
  v3[68] = CFSTR("RACP");
  v2[69] = CFSTR("2BF4");
  v3[69] = CFSTR("GHS Control Point");
  v2[70] = CFSTR("2BF1");
  v3[70] = CFSTR("Observation Schedule Changed");
  v2[71] = CFSTR("183F");
  v3[71] = CFSTR("Elapsed Time");
  v2[72] = CFSTR("2BF2");
  v3[72] = CFSTR("Current Elapsed Time");
  v2[73] = CFSTR("181C");
  v3[73] = CFSTR("User Data");
  v2[74] = CFSTR("2A99");
  v3[74] = CFSTR("Database Change Increment");
  v2[75] = CFSTR("2A9A");
  v3[75] = CFSTR("User Index");
  v2[76] = CFSTR("2A9F");
  v3[76] = CFSTR("User Control Point");
  v2[77] = CFSTR("2B37");
  v3[77] = CFSTR("Registered User");
  v2[78] = CFSTR("0x2A37");
  v3[78] = CFSTR("Heart Rate Measurement");
  v2[79] = CFSTR("0x2A38");
  v3[79] = CFSTR("Body Sensor Location");
  v2[80] = CFSTR("0x2A39");
  v3[80] = CFSTR("Heart Rate Control Point");
  v2[81] = CFSTR("181E");
  v3[81] = CFSTR("Bond Management");
  v2[82] = CFSTR("D0611E78-BBB4-4591-A5F8-487910AE4366");
  v3[82] = CFSTR("Continuity");
  v2[83] = CFSTR("8667556C-9A37-4C91-84ED-54EE27D90049");
  v3[83] = CFSTR("Continuity");
  v2[84] = CFSTR("03B80E5A-EDE8-4B33-A751-6CE34EC4C700");
  v3[84] = CFSTR("BLE MIDI");
  v2[85] = CFSTR("9bd708d7-64c7-4e9f-9ded-f6b6c4551967");
  v3[85] = CFSTR("DoAP");
  v2[86] = CFSTR("f195b8fb-a9e2-4401-858b-2f87a06928a8");
  v3[86] = CFSTR("DoAP Supported Codec");
  v2[87] = CFSTR("e1f9b835-7e47-413d-af94-c68e574b8f7e");
  v3[87] = CFSTR("DoAP Select Codec");
  v2[88] = CFSTR("a08ce5ef-698a-42a2-b980-7f3ac00b3845");
  v3[88] = CFSTR("DoAP Start Streaming");
  v2[89] = CFSTR("6288ea2d-7b89-47ad-890b-9fa6bf3cfc58");
  v3[89] = CFSTR("DoAP Stop Streaming");
  v2[90] = CFSTR("3f1c161d-6473-4746-91f5-6d27610780c6");
  v3[90] = CFSTR("DoAP Send Data");
  v2[91] = CFSTR("c7c6947d-3165-4bcb-8eaf-b328896cb531");
  v3[91] = CFSTR("DoAP Event Indicator");
  v2[92] = CFSTR("7798082b-b7b7-45a6-9933-563492efe04e");
  v3[92] = CFSTR("Apple Headset Property");
  v2[93] = CFSTR("82f6bc0a-1bca-4873-afc9-ec5890e3469a");
  v3[93] = CFSTR("Dosimetry Sensitivity");
  v2[94] = CFSTR("d5f96afa-2f2c-41bb-a7e6-f54abe6235b4");
  v3[94] = CFSTR("Dosimetry Volume Curve");
  v2[95] = CFSTR("1853");
  v3[95] = CFSTR("Common Audio Service");
  v2[96] = CFSTR("1850");
  v3[96] = CFSTR("Published Audio Capabilities Service");
  v2[97] = CFSTR("2BC9");
  v3[97] = CFSTR("Sink PAC");
  v2[98] = CFSTR("2BCB");
  v3[98] = CFSTR("Source PAC");
  v2[99] = CFSTR("2BCA");
  v3[99] = CFSTR("Sink Audio Locations");
  v2[100] = CFSTR("2BCC");
  v3[100] = CFSTR("Source Audio Locations");
  v2[101] = CFSTR("2BCD");
  v3[101] = CFSTR("Available Audio Contexts");
  v2[102] = CFSTR("2BCE");
  v3[102] = CFSTR("Supported Audio Contexts");
  v2[103] = CFSTR("184E");
  v3[103] = CFSTR("Audio Stream Control Service");
  v2[104] = CFSTR("2BC4");
  v3[104] = CFSTR("Sink ASE");
  v2[105] = CFSTR("2BC5");
  v3[105] = CFSTR("Source ASE");
  v2[106] = CFSTR("2BC6");
  v3[106] = CFSTR("ASE Control Point");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 107);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v0;

}

@end
