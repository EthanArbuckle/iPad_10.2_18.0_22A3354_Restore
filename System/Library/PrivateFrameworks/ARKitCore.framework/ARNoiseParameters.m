@implementation ARNoiseParameters

+ (int)modelIdentifierForDevicePosition:(int64_t)a3 longEdgeImageResolution:(unsigned int)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = MGGetProductType();
  if (v6 > 2385671068)
  {
    if (v6 > 3184375230)
    {
      if (v6 <= 3636345304)
      {
        if (v6 <= 3361025852)
        {
          if (v6 <= 3215673113)
          {
            if (v6 == 3184375231)
              goto LABEL_139;
            v15 = 3196158497;
            goto LABEL_166;
          }
          if (v6 != 3215673114)
          {
            if (v6 == 3228373941)
              goto LABEL_182;
            v12 = 3241053352;
            goto LABEL_181;
          }
          goto LABEL_206;
        }
        if (v6 <= 3540156651)
        {
          if (v6 == 3361025853)
            goto LABEL_182;
          if (v6 != 3397214291)
          {
            if (v6 != 3455223061)
              return 77;
            goto LABEL_212;
          }
LABEL_206:
          if (a3 == 1 && a4 == 1280)
            return 26;
          if (a3 == 1 && a4 == 1440)
            return 27;
          if (a3 == 2 && a4 == 1280)
            return 28;
          return 77;
        }
        if (v6 == 3540156652)
          goto LABEL_182;
        if (v6 == 3585085679)
          goto LABEL_215;
        v10 = 3599094683;
LABEL_96:
        if (v6 != v10)
          return 77;
        goto LABEL_101;
      }
      if (v6 > 3801472100)
      {
        if (v6 <= 3885279869)
        {
          if (v6 == 3801472101)
            goto LABEL_167;
          if (v6 == 3825599860)
            goto LABEL_170;
          v10 = 3863625342;
          goto LABEL_96;
        }
        if (v6 != 3885279870 && v6 != 4201643249)
        {
          v7 = 4242862982;
          goto LABEL_117;
        }
LABEL_121:
        if (a3 == 1 && a4 == 1280)
          return 43;
        if (a3 == 1 && a4 == 1920)
          return 44;
        if (a3 == 1 && a4 == 3840)
          return 45;
        if (a3 == 2 && a4 == 1280)
          return 46;
        if (a3 == 2 && a4 == 1440)
          return 47;
        return 77;
      }
      if (v6 > 3677894690)
      {
        if (v6 == 3677894691)
          goto LABEL_182;
        if (v6 != 3711192744)
        {
          v13 = 3743999268;
          goto LABEL_151;
        }
LABEL_212:
        if (a3 == 1 && a4 == 1280)
          return 8;
        if (a3 == 1 && a4 == 1920)
          return 9;
        if (a3 == 2 && a4 == 1280)
          return 10;
        return 77;
      }
      if (v6 == 3636345305)
        goto LABEL_167;
      v11 = 3645319985;
LABEL_157:
      if (v6 != v11)
        return 77;
      goto LABEL_158;
    }
    if (v6 <= 2673319455)
    {
      if (v6 > 2619317133)
      {
        if (v6 <= 2628394913)
        {
          if (v6 == 2619317134)
            goto LABEL_182;
          v12 = 2622433984;
        }
        else
        {
          if (v6 == 2628394914 || v6 == 2634105757)
            goto LABEL_182;
          v12 = 2644487444;
        }
        goto LABEL_181;
      }
      if (v6 <= 2487868871)
      {
        if (v6 == 2385671069)
          goto LABEL_158;
        v15 = 2458172802;
        goto LABEL_166;
      }
      if (v6 == 2487868872)
        goto LABEL_182;
      if (v6 == 2516717268)
      {
LABEL_158:
        if (a3 == 1 && a4 == 1280)
          return 2;
        if (a3 == 1 && a4 == 1440)
          return 3;
        return 77;
      }
      v11 = 2614323575;
      goto LABEL_157;
    }
    if (v6 <= 2903084587)
    {
      if (v6 > 2722529671)
      {
        if (v6 == 2722529672)
          goto LABEL_134;
        if (v6 == 2793418701)
          goto LABEL_170;
        v9 = 2795618603;
LABEL_69:
        if (v6 != v9)
          return 77;
        goto LABEL_170;
      }
      if (v6 == 2673319456)
        goto LABEL_158;
      if (v6 != 2688879999)
        return 77;
    }
    else
    {
      if (v6 > 3001488777)
      {
        if (v6 != 3001488778)
        {
          if (v6 == 3054476161)
            goto LABEL_182;
          v12 = 3101941570;
          goto LABEL_181;
        }
        goto LABEL_121;
      }
      if (v6 == 2903084588)
        goto LABEL_182;
      if (v6 != 2940697645)
      {
        v9 = 2941181571;
        goto LABEL_69;
      }
    }
    if (a3 == 1 && a4 == 1280)
      return 67;
    if (a3 == 1 && a4 == 1920)
      return 68;
    if (a3 == 1 && a4 == 3840)
      return 69;
    if (a3 == 2 && a4 == 1280)
      return 70;
    if (a3 == 2 && a4 == 1440)
      return 71;
    return 77;
  }
  if (v6 <= 1371389548)
  {
    if (v6 > 746003605)
    {
      if (v6 > 1060988940)
      {
        if (v6 <= 1280441782)
        {
          if (v6 != 1060988941)
          {
            if (v6 != 1169082144)
            {
              if (v6 == 1234705395)
              {
                if (a3 == 1 && a4 == 1280)
                  return 33;
                if (a3 == 1 && a4 == 1920)
                  return 34;
                if (a3 == 2 && a4 == 1280)
                  return 35;
                if (a3 == 2 && a4 == 1440)
                  return 36;
              }
              return 77;
            }
            goto LABEL_121;
          }
LABEL_215:
          if (a3 == 1 && a4 == 1280)
            return 48;
          if (a3 == 1 && a4 == 1920)
            return 49;
          if (a3 == 1 && a4 == 3840)
            return 50;
          if (a3 == 2 && a4 == 1280)
            return 51;
          if (a3 == 2 && a4 == 1440)
            return 52;
          return 77;
        }
        if (v6 != 1280441783)
        {
          if (v6 == 1293446025)
            goto LABEL_101;
          v15 = 1353145733;
          goto LABEL_166;
        }
LABEL_139:
        if (a3 == 1 && a4 == 1280)
          return 15;
        if (a3 == 1 && a4 == 1440)
          return 16;
        return 77;
      }
      if (v6 <= 820711326)
      {
        if (v6 == 746003606)
          goto LABEL_182;
        v12 = 810906663;
        goto LABEL_181;
      }
      if (v6 == 820711327)
        goto LABEL_127;
      if (v6 != 851437781)
      {
        v13 = 910181310;
        goto LABEL_151;
      }
      goto LABEL_170;
    }
    if (v6 <= 330877085)
    {
      if (v6 <= 133314239)
      {
        if (v6 == 79936591)
          goto LABEL_127;
        if (v6 != 88647037)
          return 77;
        goto LABEL_139;
      }
      if (v6 == 133314240)
      {
LABEL_170:
        if (a3 == 1 && a4 == 1280)
          return 72;
        if (a3 == 1 && a4 == 1920)
          return 73;
        if (a3 == 1 && a4 == 3840)
          return 74;
        if (a3 == 2 && a4 == 1280)
          return 75;
        if (a3 == 2 && a4 == 1440)
          return 76;
        return 77;
      }
      if (v6 == 157833461)
        goto LABEL_139;
      v11 = 228444038;
      goto LABEL_157;
    }
    if (v6 > 555503453)
    {
      if (v6 == 555503454)
        goto LABEL_182;
      if (v6 != 574536383)
      {
        v14 = 689804742;
        goto LABEL_110;
      }
      goto LABEL_170;
    }
    if (v6 == 330877086)
      goto LABEL_170;
    v15 = 341800273;
LABEL_166:
    if (v6 != v15)
      return 77;
LABEL_167:
    if (a3 == 1 && a4 == 1280)
      return 4;
    if (a3 == 1 && a4 == 1920)
      return 5;
    if (a3 == 2 && a4 == 1280)
      return 6;
    if (a3 == 2 && a4 == 1440)
      return 7;
    return 77;
  }
  if (v6 > 2023824666)
  {
    if (v6 > 2103978417)
    {
      if (v6 <= 2236272847)
      {
        if (v6 != 2103978418)
        {
          if (v6 != 2158787296)
          {
            if (v6 != 2159747553)
              return 77;
            goto LABEL_209;
          }
LABEL_127:
          if (a3 == 1 && a4 == 1280)
            return 0;
          if (a3 == 1 && a4 == 1920)
            return 1;
          return 77;
        }
LABEL_101:
        if (a3 == 1 && a4 == 1280)
          return 11;
        if (a3 == 1 && a4 == 1920)
          return 12;
        if (a3 == 2 && a4 == 1280)
          return 13;
        if (a3 == 2 && a4 == 1440)
          return 14;
        return 77;
      }
      if (v6 == 2236272848)
        goto LABEL_167;
      if (v6 == 2262113699)
        goto LABEL_127;
      v14 = 2309863438;
LABEL_110:
      if (v6 == v14)
      {
        if (a3 == 1 && a4 == 1280)
          return 53;
        if (a3 == 1 && a4 == 1920)
          return 54;
        if (a3 == 1 && a4 == 3840)
          return 55;
        if (a3 == 2 && a4 == 1280)
          return 56;
        if (a3 == 2 && a4 == 1440)
          return 57;
      }
      return 77;
    }
    if (v6 > 2078329140)
    {
      if (v6 != 2078329141)
      {
        if (v6 != 2080700391)
        {
          v12 = 2089455188;
          goto LABEL_181;
        }
        goto LABEL_134;
      }
LABEL_209:
      if (a3 == 1 && a4 == 1280)
        return 58;
      if (a3 == 1 && a4 == 1920)
        return 59;
      if (a3 == 2 && a4 == 1280)
        return 60;
      if (a3 == 2 && a4 == 1440)
        return 61;
      return 77;
    }
    if (v6 == 2023824667)
      goto LABEL_182;
    v13 = 2032616841;
LABEL_151:
    if (v6 == v13)
    {
      if (a3 == 1 && a4 == 1280)
        return 29;
      if (a3 == 1 && a4 == 1920)
        return 30;
      if (a3 == 2 && a4 == 1280)
        return 31;
      if (a3 == 2 && a4 == 1440)
        return 32;
    }
    return 77;
  }
  if (v6 <= 1834147426)
  {
    if (v6 > 1380747800)
    {
      if (v6 == 1380747801)
      {
        if (a3 == 1 && a4 == 1280)
          return 37;
        return 77;
      }
      if (v6 == 1434404433)
      {
LABEL_90:
        if (a3 == 1 && a4 == 1280)
          return 62;
        if (a3 == 1 && a4 == 1920)
          return 63;
        if (a3 == 1 && a4 == 3840)
          return 64;
        if (a3 == 2 && a4 == 1280)
          return 65;
        if (a3 == 2 && a4 == 1440)
          return 66;
        return 77;
      }
      v12 = 1625227434;
LABEL_181:
      if (v6 != v12)
        return 77;
LABEL_182:
      if (a3 == 1 && a4 == 1280)
        return 18;
      if (a3 == 1 && a4 == 1920)
        return 19;
      if (a3 == 1 && a4 == 3840)
        return 17;
      if (a3 == 2 && a4 == 1280)
        return 20;
      if (a3 == 2 && a4 == 1440)
        return 21;
      return 77;
    }
    if (v6 != 1371389549)
    {
      v12 = 1373516433;
      goto LABEL_181;
    }
LABEL_134:
    if (a3 == 1 && a4 == 1280)
      return 38;
    if (a3 == 1 && a4 == 1920)
      return 39;
    if (a3 == 1 && a4 == 3840)
      return 40;
    if (a3 == 2 && a4 == 1280)
      return 41;
    if (a3 == 2 && a4 == 1440)
      return 42;
    return 77;
  }
  if (v6 <= 1895344377)
  {
    if (v6 != 1834147427 && v6 != 1868379043)
    {
      v7 = 1878257790;
LABEL_117:
      if (v6 == v7)
      {
        if (a3 == 1 && a4 == 1280)
          return 22;
        if (a3 == 1 && a4 == 1440)
          return 23;
        if (a3 == 2 && a4 == 1280)
          return 24;
        if (a3 == 2 && a4 == 1440)
          return 25;
      }
      return 77;
    }
    goto LABEL_182;
  }
  switch(v6)
  {
    case 1895344378:
      goto LABEL_182;
    case 2001966017:
      goto LABEL_167;
    case 2021146989:
      goto LABEL_90;
  }
  return 77;
}

@end
