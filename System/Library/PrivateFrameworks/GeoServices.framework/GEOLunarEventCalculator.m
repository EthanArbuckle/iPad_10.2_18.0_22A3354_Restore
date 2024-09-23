@implementation GEOLunarEventCalculator

- (id)lunarEventsFrom:(id)a3 to:(id)a4
{
  -[GEOLunarEventCalculator lunarEventsFrom:to:altitude:](self, "lunarEventsFrom:to:altitude:", a3, a4, 0.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lunarEventsFrom:(id)a3 to:(id)a4 altitude:(double)a5
{
  id v8;
  id v9;
  CAADynamicalTime *v10;
  double v11;
  double v12;
  CAADynamicalTime *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  CAADynamicalTime *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char v22;
  void *v23;
  GEOLunarEvent *v24;
  id v25;
  char *v26;
  id v28;
  CAADynamicalTime *v29;
  __int128 v30;
  char *v31;
  char *v32;
  objc_super v33;

  v8 = a3;
  v9 = a4;
  v28 = v9;
  v10 = (CAADynamicalTime *)objc_msgSend(v8, "geo_julianDay");
  v12 = CAADynamicalTime::UTC2TT(v10, v11);
  v13 = (CAADynamicalTime *)objc_msgSend(v9, "geo_julianDay");
  v15 = CAADynamicalTime::UTC2TT(v13, v14) + 0.007;
  if (a5 == 0.0)
    v16 = -0.5667;
  else
    v16 = acos(6371008.0 / (a5 + 6371008.0)) * -57.2957795 + -0.5667;
  CAARiseTransitSet2::CalculateMoon(0, (uint64_t)&v31, v12, v15, -self->_location.longitude, self->_location.latitude, v16, 0.007);
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18 = (CAADynamicalTime *)objc_msgSend(v17, "initWithCapacity:", 0xCCCCCCCCCCCCCCCDLL * ((v32 - v31) >> 3));
  v29 = v18;
  v19 = v31;
  v20 = v32;
  if (v31 != v32)
  {
    while (2)
    {
      v21 = 0;
      v22 = v19[32];
      switch(*(_DWORD *)v19)
      {
        case 0:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 0xA:
          goto LABEL_16;
        case 2:
          v21 = 1;
          goto LABEL_9;
        case 3:
          v21 = 3;
          goto LABEL_9;
        case 4:
          v21 = 2;
          goto LABEL_9;
        default:
LABEL_9:
          v30 = *((_OWORD *)v19 + 1);
          objc_msgSend(MEMORY[0x1E0C99D68], "geo_dateWithJulianDay:", CAADynamicalTime::TT2UTC(v18, *((double *)v19 + 1)));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v23, "compare:", v8) != -1 && objc_msgSend(v23, "compare:", v9) == -1)
          {
            v24 = [GEOLunarEvent alloc];
            v25 = v23;
            if (v24)
            {
              v33.receiver = v24;
              v33.super_class = (Class)GEOLunarEvent;
              v26 = -[GEOLunarEventCalculator init](&v33, sel_init);
              v24 = (GEOLunarEvent *)v26;
              if (v26)
              {
                *((_QWORD *)v26 + 2) = v21;
                *(_OWORD *)(v26 + 24) = v30;
                v26[8] = v22 & 1;
                objc_storeStrong((id *)v26 + 5, v23);
              }
            }

            -[CAADynamicalTime addObject:](v29, "addObject:", v24);
            v9 = v28;
          }

LABEL_16:
          v19 += 40;
          if (v19 != v20)
            continue;
          v19 = v31;
          break;
      }
      break;
    }
  }
  if (v19)
  {
    v32 = v19;
    operator delete(v19);
  }

  return v29;
}

- (GEOLunarEventCalculator)initWithLocation:(id)a3
{
  double var1;
  double var0;
  GEOLunarEventCalculator *result;
  objc_super v6;

  var1 = a3.var1;
  var0 = a3.var0;
  v6.receiver = self;
  v6.super_class = (Class)GEOLunarEventCalculator;
  result = -[GEOLunarEventCalculator init](&v6, sel_init);
  if (result)
  {
    result->_location.latitude = var0;
    result->_location.longitude = var1;
  }
  return result;
}

@end
