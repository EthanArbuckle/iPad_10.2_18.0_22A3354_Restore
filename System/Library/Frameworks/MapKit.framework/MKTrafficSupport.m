@implementation MKTrafficSupport

void __40__MKTrafficSupport_sharedTrafficSupport__block_invoke()
{
  MKTrafficSupport *v0;
  void *v1;

  v0 = objc_alloc_init(MKTrafficSupport);
  v1 = (void *)_MergedGlobals_162;
  _MergedGlobals_162 = (uint64_t)v0;

}

- (void)setupTrafficIncidents
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MKTrafficSupport_setupTrafficIncidents__block_invoke;
  block[3] = &unk_1E20D7D98;
  block[4] = self;
  if (setupTrafficIncidents_onceToken != -1)
    dispatch_once(&setupTrafficIncidents_onceToken, block);
}

+ (id)sharedTrafficSupport
{
  if (qword_1ECE2DD20 != -1)
    dispatch_once(&qword_1ECE2DD20, &__block_literal_global_82);
  return (id)_MergedGlobals_162;
}

uint64_t __41__MKTrafficSupport_setupTrafficIncidents__block_invoke()
{
  VKTrafficIncidentSetTitleBlock();
  return VKTrafficIncidentSetSubtitleBlock();
}

uint64_t __41__MKTrafficSupport_setupTrafficIncidents__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "localizedTitleForIncidentType:laneType:laneCount:", a2, a3, a4);
}

uint64_t __41__MKTrafficSupport_setupTrafficIncidents__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "localizedSubtitleForStreet:crossStreet:", a2, a3);
}

- (int64_t)_convertType:(int)a3
{
  int64_t result;

  result = 1;
  switch(a3)
  {
    case 0:
      return result;
    case 1:
      result = 2;
      break;
    case 2:
      result = 3;
      break;
    case 3:
      result = 4;
      break;
    case 4:
      result = 5;
      break;
    case 5:
      result = 6;
      break;
    case 6:
      result = 7;
      break;
    case 13:
      result = 13;
      break;
    case 14:
      result = 14;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)localizedTitleForGEOIncidentType:(int)a3 laneType:(int)a4 laneCount:(unint64_t)a5
{
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = -[MKTrafficSupport _convertType:](self, "_convertType:", *(_QWORD *)&a3);
  v9 = (a4 - 1);
  if (v9 < 6)
    v10 = v9 + 1;
  else
    v10 = 0;
  return -[MKTrafficSupport localizedTitleForIncidentType:laneType:laneCount:](self, "localizedTitleForIncidentType:laneType:laneCount:", v8, v10, a5);
}

- (id)localizedTitleForIncidentType:(int64_t)a3 laneType:(int64_t)a4 laneCount:(unint64_t)a5
{
  __CFString *v5;
  const __CFString *v7;
  const __CFString *v8;

  v5 = CFSTR("Crash");
  switch(a3)
  {
    case 0:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
      v5 = CFSTR("Incident");
      goto LABEL_3;
    case 1:
      goto LABEL_3;
    case 2:
      v5 = CFSTR("Roadwork");
      goto LABEL_3;
    case 3:
      v5 = CFSTR("Road Closed");
      goto LABEL_3;
    case 4:
      v5 = CFSTR("Event");
      goto LABEL_3;
    case 5:
      v5 = CFSTR("Hazard");
      goto LABEL_3;
    case 6:
      switch(a4)
      {
        case 1:
          v7 = CFSTR("Left Lanes Closed");
          v8 = CFSTR("Left Lane Closed");
          break;
        case 2:
          v7 = CFSTR("Center Lanes Closed");
          v8 = CFSTR("Center Lane Closed");
          break;
        case 3:
          v7 = CFSTR("Right Lanes Closed");
          v8 = CFSTR("Right Lane Closed");
          break;
        case 4:
          v7 = CFSTR("Shoulder Lanes Closed");
          v8 = CFSTR("Shoulder Lane Closed");
          break;
        case 5:
          v7 = CFSTR("Carpool Lanes Closed");
          v8 = CFSTR("Carpool Lane Closed");
          break;
        case 6:
          v7 = CFSTR("Bus Lanes Closed");
          v8 = CFSTR("Bus Lane Closed");
          break;
        default:
          v7 = CFSTR("Lanes Closed");
          v8 = CFSTR("Lane Closed");
          break;
      }
      if (a5 >= 2)
        v5 = (__CFString *)v7;
      else
        v5 = (__CFString *)v8;
      goto LABEL_3;
    case 7:
      v5 = CFSTR("Ramp Closed");
      goto LABEL_3;
    case 13:
      v5 = CFSTR("Speed Check");
LABEL_3:
      _MKLocalizedStringFromThisBundle(v5);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v5;
  }
  return v5;
}

- (id)localizedSubtitleForStreet:(id)a3 crossStreet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    if (objc_msgSend(v6, "length"))
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      _MKLocalizedStringFromThisBundle(CFSTR("%@ at %@"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", v8, v5, v6);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v5;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)localizedRAPDescriptionForGEOIncidentType:(int)a3
{
  unint64_t v3;
  void *v4;

  v3 = -[MKTrafficSupport _convertType:](self, "_convertType:", *(_QWORD *)&a3);
  if (v3 <= 0xE)
  {
    _MKLocalizedStringFromThisBundle(off_1E20DC8C0[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)localizedReportConfirmationForIncidentType:(int)a3
{
  unint64_t v3;
  void *v4;

  v3 = -[MKTrafficSupport _convertType:](self, "_convertType:", *(_QWORD *)&a3);
  if (v3 <= 0xE)
  {
    _MKLocalizedStringFromThisBundle(off_1E20DC938[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)localizedReportedByYouForGEOIncidentType:(int)a3
{
  unint64_t v3;
  void *v4;

  v3 = -[MKTrafficSupport _convertType:](self, "_convertType:", *(_QWORD *)&a3);
  if (v3 <= 0xE)
  {
    _MKLocalizedStringFromThisBundle(off_1E20DC9B0[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

@end
