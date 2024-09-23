@implementation MOVStreamIOUtility

+ (id)stringFromTimeCode:(CVSMPTETime *)a3 dropFrame:(BOOL)a4
{
  uint64_t v4;

  v4 = 58;
  if (a4)
    v4 = 59;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02d:%02d:%02d%c%02d"), a3->hours, a3->minutes, a3->seconds, v4, a3->frames);
}

+ (CVSMPTETime)timeCodeFromString:(SEL)a3 isDropFrame:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CVSMPTETime *result;
  id v19;

  v7 = a4;
  if (a5)
    *a5 = 0;
  *(_QWORD *)&retstr->subframes = 0;
  *(_QWORD *)&retstr->type = 0;
  *(_QWORD *)&retstr->hours = 0;
  v19 = v7;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(":"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") >= 3)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->hours = objc_msgSend(v9, "integerValue");

    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    retstr->minutes = objc_msgSend(v10, "integerValue");

    if (objc_msgSend(v8, "count") == 4)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      retstr->seconds = objc_msgSend(v11, "integerValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      retstr->frames = objc_msgSend(v12, "integerValue");
    }
    else
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR(";,"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsSeparatedByCharactersInSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "count") == 2)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        retstr->seconds = objc_msgSend(v15, "integerValue");

        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        retstr->frames = objc_msgSend(v16, "integerValue");

        v17 = objc_msgSend(v12, "rangeOfString:", CFSTR(";"));
        if (a5)
        {
          if (v17 != 0x7FFFFFFFFFFFFFFFLL)
            *a5 = 1;
        }
      }
      v8 = v14;
    }

  }
  return result;
}

+ (double)transformAngleFromVideoOrientation:(int)a3
{
  double result;

  result = 0.0;
  if (a3 <= 4)
    return dbl_2106E4540[a3];
  return result;
}

+ (id)jsonFriendlyCopy:(id)a3
{
  objc_msgSend(a1, "getJsonFriendlyCopy:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)plistFriendlyCopyOf:(id)a3
{
  objc_msgSend(a1, "getPlistFriendlyCopyOf:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (opaqueCMFormatDescription)formatForPixelBuffer:(__CVBuffer *)a3
{
  CMVideoFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, &formatDescriptionOut);
  return formatDescriptionOut;
}

+ (opaqueCMFormatDescription)createFormatDescriptionFromPixelBuffer:(__CVBuffer *)a3
{
  CMVideoFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, &formatDescriptionOut);
  return formatDescriptionOut;
}

+ (opaqueCMFormatDescription)newFormatDescriptionFromPixelBuffer:(__CVBuffer *)a3
{
  CMVideoFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, &formatDescriptionOut);
  return formatDescriptionOut;
}

+ (unint64_t)getPreferredPlaneAlignmentSize
{
  size_t v3;
  unint64_t v4;

  v3 = 8;
  v4 = 0;
  sysctlbyname("hw.pagesize", &v4, &v3, 0, 0);
  return v4;
}

+ (unint64_t)getPreferredBytesPerRowAlignmentSize
{
  size_t v3;
  unint64_t v4;

  v3 = 8;
  v4 = 0;
  sysctlbyname("hw.cachelinesize", &v4, &v3, 0, 0);
  return v4;
}

+ (BOOL)pixelFormatIs420Sampled:(unsigned int)a3
{
  BOOL result;
  int v4;
  unsigned __int16 v5;
  unsigned __int16 v6;

  result = 1;
  if ((int)a3 <= 1563981359)
  {
    if ((int)a3 > 762865199)
    {
      if ((int)a3 > 875704437)
      {
        if ((int)a3 > 1534359087)
        {
          if ((int)a3 > 1534621231)
          {
            if (a3 == 1534621232)
              return result;
            v4 = 1563977264;
          }
          else
          {
            if (a3 == 1534359088)
              return result;
            v4 = 1534617136;
          }
        }
        else if ((int)a3 > 1530426927)
        {
          if (a3 == 1530426928)
            return result;
          v4 = 1534354992;
        }
        else
        {
          if (a3 == 875704438)
            return result;
          v4 = 1530422832;
        }
      }
      else if ((int)a3 > 795371055)
      {
        if ((int)a3 > 796423727)
        {
          if (a3 == 796423728)
            return result;
          v4 = 875704422;
        }
        else
        {
          if (a3 == 795371056)
            return result;
          v4 = 796419632;
        }
      }
      else if ((int)a3 > 792225327)
      {
        if (a3 == 792225328)
          return result;
        v4 = 792229424;
      }
      else
      {
        if (a3 == 762865200)
          return result;
        v4 = 762869296;
      }
    }
    else if ((int)a3 > 645166639)
    {
      if ((int)a3 > 645429039)
      {
        if ((int)a3 > 758674991)
        {
          if (a3 == 758674992)
            return result;
          v4 = 761816624;
        }
        else
        {
          if (a3 == 645429040)
            return result;
          v4 = 758670896;
        }
      }
      else if ((int)a3 > 645424687)
      {
        if (a3 == 645424688)
          return result;
        v4 = 645428784;
      }
      else
      {
        if (a3 == 645166640)
          return result;
        v4 = 645279800;
      }
    }
    else if ((int)a3 > 644376111)
    {
      if ((int)a3 > 645101103)
      {
        if (a3 == 645101104)
          return result;
        v4 = 645162544;
      }
      else
      {
        if (a3 == 644376112)
          return result;
        v4 = 645097008;
      }
    }
    else if ((int)a3 > 641230383)
    {
      if (a3 == 641230384)
        return result;
      v4 = 641234480;
    }
    else
    {
      if (a3 == 590898736)
        return result;
      v4 = 590902832;
    }
    goto LABEL_98;
  }
  if ((int)a3 > 1982882103)
  {
    if ((int)a3 > 2087216687)
    {
      if ((int)a3 > 2100852271)
      {
        if ((int)a3 > 2105046575)
        {
          if (a3 == 2105046576)
            return result;
          v6 = 30512;
        }
        else
        {
          if (a3 == 2100852272)
            return result;
          v6 = 26160;
        }
        v4 = v6 | 0x7D780000;
      }
      else if ((int)a3 > 2088269359)
      {
        if (a3 == 2088269360)
          return result;
        v4 = 2100848176;
      }
      else
      {
        if (a3 == 2087216688)
          return result;
        v4 = 2088265264;
      }
    }
    else if ((int)a3 > 2021077551)
    {
      if ((int)a3 > 2084070959)
      {
        if (a3 == 2084070960)
          return result;
        v4 = 2084075056;
      }
      else
      {
        if (a3 == 2021077552)
          return result;
        v4 = 2033463856;
      }
    }
    else if ((int)a3 > 2016686639)
    {
      if (a3 == 2016686640)
        return result;
      v4 = 2019963440;
    }
    else
    {
      if (a3 == 1982882104)
        return result;
      v4 = 1983013176;
    }
  }
  else
  {
    if ((int)a3 > 1886680623)
    {
      if ((int)a3 > 1937125935)
      {
        if ((int)a3 > 1953903151)
        {
          if (a3 == 1953903152)
            return result;
          v4 = 1953968688;
        }
        else
        {
          if (a3 == 1937125936)
            return result;
          v4 = 1952854576;
        }
        goto LABEL_98;
      }
      if ((int)a3 > 1886859823)
      {
        if (a3 == 1886859824)
          return result;
        v4 = 1936077360;
        goto LABEL_98;
      }
      if (a3 == 1886680624)
        return result;
      v5 = 30512;
    }
    else
    {
      if ((int)a3 <= 1751527983)
      {
        if ((int)a3 > 1568175663)
        {
          if (a3 == 1568175664)
            return result;
          v4 = 1714696752;
        }
        else
        {
          if (a3 == 1563981360)
            return result;
          v4 = 1568171568;
        }
        goto LABEL_98;
      }
      if ((int)a3 <= 1885745711)
      {
        if (a3 == 1751527984)
          return result;
        v4 = 1882468912;
        goto LABEL_98;
      }
      if (a3 == 1885745712)
        return result;
      v5 = 26160;
    }
    v4 = v5 | 0x70740000;
  }
LABEL_98:
  if (a3 != v4)
    return 0;
  return result;
}

+ (BOOL)pixelFormatIs422Sampled:(unsigned int)a3
{
  BOOL result;
  unsigned __int16 v4;
  int v5;
  unsigned __int16 v6;
  unsigned __int16 v7;
  unsigned __int16 v8;

  result = 1;
  if ((int)a3 <= 1568175665)
  {
    if ((int)a3 <= 762865201)
    {
      if ((int)a3 > 645166641)
      {
        if ((int)a3 > 645428785)
        {
          if ((int)a3 > 645494117)
          {
            if (a3 == 645494118)
              return result;
            v5 = 645494131;
            goto LABEL_103;
          }
          if (a3 == 645428786)
            return result;
          v8 = 30514;
        }
        else
        {
          if ((int)a3 <= 645411442)
          {
            if (a3 == 645166642)
              return result;
            v5 = 645280312;
            goto LABEL_103;
          }
          if (a3 == 645411443)
            return result;
          v8 = 26162;
        }
        v5 = v8 | 0x26780000;
      }
      else
      {
        if ((int)a3 > 645097009)
        {
          if ((int)a3 > 645149298)
          {
            if (a3 == 645149299)
              return result;
            v5 = 645162546;
            goto LABEL_103;
          }
          if (a3 == 645097010)
            return result;
          v6 = 30258;
        }
        else
        {
          if ((int)a3 <= 644376113)
          {
            if (a3 == 641230386)
              return result;
            v5 = 641234482;
            goto LABEL_103;
          }
          if (a3 == 644376114)
            return result;
          v6 = 12915;
        }
        v5 = v6 | 0x26730000;
      }
LABEL_103:
      if (a3 != v5)
        return 0;
      return result;
    }
    if ((int)a3 <= 1530422833)
    {
      if ((int)a3 > 846624101)
      {
        if ((int)a3 > 875704933)
        {
          if (a3 == 875704934)
            return result;
          v5 = 875704950;
        }
        else
        {
          if (a3 == 846624102)
            return result;
          v5 = 846624121;
        }
      }
      else if ((int)a3 > 796419633)
      {
        if (a3 == 796419634)
          return result;
        v5 = 796423730;
      }
      else
      {
        if (a3 == 762865202)
          return result;
        v5 = 762869298;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 1534617137)
    {
      if ((int)a3 > 1534354993)
      {
        if (a3 == 1534354994)
          return result;
        v5 = 1534359090;
      }
      else
      {
        if (a3 == 1530422834)
          return result;
        v5 = 1530426930;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 1563977265)
    {
      if (a3 == 1534617138)
        return result;
      v5 = 1534621234;
      goto LABEL_103;
    }
    if (a3 != 1563977266 && a3 != 1563981362)
    {
      v5 = 1568171570;
      goto LABEL_103;
    }
  }
  else if ((int)a3 > 1983000885)
  {
    if ((int)a3 <= 2037741157)
    {
      if ((int)a3 > 2016686641)
      {
        if ((int)a3 > 2019963503)
        {
          if (a3 == 2019963504)
            return result;
          v5 = 2021077554;
        }
        else
        {
          if (a3 == 2016686642)
            return result;
          v5 = 2019963442;
        }
        goto LABEL_103;
      }
      if ((int)a3 > 2016555631)
      {
        if (a3 == 2016555632)
          return result;
        v5 = 2016567667;
        goto LABEL_103;
      }
      if (a3 == 1983000886)
        return result;
      v4 = 24888;
      goto LABEL_39;
    }
    if ((int)a3 <= 2100848177)
    {
      if ((int)a3 > 2088265265)
      {
        if (a3 == 2088265266)
          return result;
        v5 = 2088269362;
      }
      else
      {
        if (a3 == 2037741158)
          return result;
        v5 = 2037741171;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 2105042481)
    {
      if (a3 == 2100848178)
        return result;
      v5 = 2100852274;
      goto LABEL_103;
    }
    if (a3 != 2105042482 && a3 != 2105046578)
    {
      v5 = 2105046834;
      goto LABEL_103;
    }
  }
  else
  {
    if ((int)a3 <= 1886859825)
    {
      if ((int)a3 > 1885745713)
      {
        if ((int)a3 > 1886680625)
        {
          if (a3 == 1886680626)
            return result;
          v7 = 30514;
        }
        else
        {
          if (a3 == 1885745714)
            return result;
          v7 = 26162;
        }
        v5 = v7 | 0x70740000;
      }
      else if ((int)a3 > 1751527985)
      {
        if (a3 == 1751527986)
          return result;
        v5 = 1882468914;
      }
      else
      {
        if (a3 == 1568175666)
          return result;
        v5 = 1630697081;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 1949458802)
    {
      if ((int)a3 > 1936077361)
      {
        if (a3 == 1936077362)
          return result;
        v5 = 1937125938;
      }
      else
      {
        if (a3 == 1886859826)
          return result;
        v5 = 1932681587;
      }
      goto LABEL_103;
    }
    if ((int)a3 <= 1953903153)
    {
      if (a3 == 1949458803)
        return result;
      v5 = 1952854578;
      goto LABEL_103;
    }
    if (a3 != 1953903154 && a3 != 1953968690)
    {
      v4 = 12592;
LABEL_39:
      v5 = v4 | 0x76320000;
      goto LABEL_103;
    }
  }
  return result;
}

+ (id)dictionary:(id)a3 numberValueForKey:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)dictionary:(id)a3 stringValueForKey:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)dictionary:(id)a3 BOOLeanValueForKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

+ (BOOL)formatDescriptionRepresentsRGB:(id)a3
{
  return objc_msgSend(a1, "dictionary:BOOLeanValueForKey:", a3, *MEMORY[0x24BDC5760]);
}

+ (BOOL)formatDescriptionRepresentsGrayscale:(id)a3
{
  return objc_msgSend(a1, "dictionary:BOOLeanValueForKey:", a3, *MEMORY[0x24BDC5758]);
}

+ (BOOL)formatDescriptionRepresentsYCbCr:(id)a3
{
  return objc_msgSend(a1, "dictionary:BOOLeanValueForKey:", a3, *MEMORY[0x24BDC5770]);
}

+ (BOOL)formatDescriptionRepresentsVideoRange:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "dictionary:stringValueForKey:", a3, *MEMORY[0x24BDC5730]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDC5738]);

  return v4;
}

+ (BOOL)formatDescriptionRepresentsBayer:(id)a3
{
  return objc_msgSend(a1, "dictionary:BOOLeanValueForKey:", a3, *MEMORY[0x24BDC5768]);
}

+ (int)chromaSubsamplingForDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  char v10;
  char v12;

  v4 = a3;
  objc_msgSend(a1, "dictionary:numberValueForKey:", v4, *MEMORY[0x24BDC5798]);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionary:numberValueForKey:", v4, *MEMORY[0x24BDC5780]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!(v5 | v6))
  {
    v8 = 1;
    goto LABEL_31;
  }
  if (v5 && (int)objc_msgSend((id)v5, "intValue") >= 2)
  {
    v7 = objc_msgSend((id)v5, "intValue");
    if (!v6)
      goto LABEL_10;
  }
  else
  {
    v7 = 1;
    if (!v6)
    {
LABEL_10:
      v9 = 1;
      goto LABEL_11;
    }
  }
  if ((int)objc_msgSend((id)v6, "intValue") < 2)
    goto LABEL_10;
  v9 = objc_msgSend((id)v6, "intValue");
LABEL_11:
  v10 = objc_msgSend(a1, "formatDescriptionRepresentsBayer:", v4);
  if (v9 == 2 && v7 == 2)
    v12 = v10;
  else
    v12 = 1;
  if ((v12 & 1) != 0)
  {
    if (v9 == 2 && v7 == 1)
    {
      v8 = 2;
    }
    else if (v9 == 4 && v7 == 1)
    {
      v8 = 4;
    }
    else
    {
      v8 = v9 == 1 && v7 == 1;
    }
  }
  else
  {
    v8 = 3;
  }
LABEL_31:

  return v8;
}

+ (int)chromaSubsamplingForFormatDescription:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(a1, "chromaSubsamplingForDictionary:", v4);
  if (v5 == 1)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDC5790], 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v12;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        v5 = objc_msgSend(a1, "chromaSubsamplingForDictionary:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        if (v5 != 1)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v5 = 1;
    }

  }
  return v5;
}

+ (BOOL)attachmentsContainsRec2020orRec2100ColorPrimaries:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a1, "dictionary:stringValueForKey:", a3, *MEMORY[0x24BDC5490]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDC54B0]);

  return v4;
}

+ (BOOL)attachmentsContainsRec2020orRec2100ColorMatrices:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dictionary:stringValueForKey:", a3, *MEMORY[0x24BDC5570]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (v12 = 0u,
        v13 = 0u,
        v10 = 0u,
        v11 = 0u,
        (v4 = objc_msgSend(&unk_24CA5C090, "countByEnumeratingWithState:objects:count:", &v10, v14, 16)) != 0))
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_24CA5C090);
        CVYCbCrMatrixGetStringForIntegerCodePoint(objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "intValue"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7 && (objc_msgSend(v3, "isEqualToString:", v7) & 1) != 0)
        {

          v8 = 1;
          goto LABEL_14;
        }

      }
      v4 = objc_msgSend(&unk_24CA5C090, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v8 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_14:

  return v8;
}

+ (BOOL)attachmentsRepresentInterlacedFields:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDC54E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue") > 1;
  else
    v5 = 0;

  return v5;
}

+ (BOOL)attachmentsContainTopLeftChromaLocations:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *MEMORY[0x24BDC5418];
  v18[0] = *MEMORY[0x24BDC5420];
  v18[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x24BDC5468];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && (objc_msgSend(v10, "isEqualToString:", v8) & 1) == 0)
        {

          v12 = 0;
          goto LABEL_12;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_12:

  return v12;
}

+ (id)colorimetricWarningsForPixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  int v13;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  if (+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::once != -1)
    dispatch_once(&+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::once, &__block_literal_global_1);
  v6 = (void *)+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::s_PixelFormatInfoDictionary;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13 = 0;
    v12 = 0x100000000;
    objc_msgSend(v8, "getValue:", &v12);
    if (!HIDWORD(v12))
    {
      +[MOVStreamIOUtility colorimetricWarningsForGrayscalePixelBufferAttachments:pixelFormat:](MOVStreamIOUtility, "colorimetricWarningsForGrayscalePixelBufferAttachments:pixelFormat:", v5, v4);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (HIDWORD(v12) == 1)
    {
      +[MOVStreamIOUtility colorimetricWarningsForColorPixelBufferAttachments:pixelFormat:](MOVStreamIOUtility, "colorimetricWarningsForColorPixelBufferAttachments:pixelFormat:", v5, v4);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (void *)v9;
      goto LABEL_10;
    }
  }
  v10 = 0;
LABEL_10:

  return v10;
}

void __80__MOVStreamIOUtility_colorimetricWarningsForPixelBufferAttachments_pixelFormat___block_invoke()
{
  void *v0;
  uint64_t i;
  uint64_t v2;
  int v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 16);
  for (i = 0; i != 192; i += 12)
  {
    v2 = *(_QWORD *)((char *)&unk_2106E4458 + i);
    v9 = v2;
    v3 = *(_DWORD *)((char *)&unk_2106E4458 + i + 8);
    v10 = v3;
    if (v3)
      v4 = (_DWORD)v2 == v3;
    else
      v4 = 1;
    if (!v4)
      __assert_rtn("+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]_block_invoke", "MOVStreamIOUtility.mm", 584, "!info.pixelFormatAlt || (info.pixelFormat == info.pixelFormatAlt)");
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", &v9, "{?=IiI}");
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "setObject:forKeyedSubscript:", v5, v6);

    }
  }
  v7 = objc_msgSend(v0, "copy");
  v8 = (void *)+[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::s_PixelFormatInfoDictionary;
  +[MOVStreamIOUtility colorimetricWarningsForPixelBufferAttachments:pixelFormat:]::s_PixelFormatInfoDictionary = v7;

}

+ (id)colorimetricWarningsForColorPixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4
{
  id v5;
  CFDictionaryRef v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  int v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  uint64_t v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  _BOOL4 v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t ii;
  uint64_t v62;
  void *v63;
  void *v64;
  BOOL v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  unsigned int v73;
  const __CFDictionary *v74;
  uint64_t v76;
  id v77;
  id obj;
  int v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[2];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[4];

  v116[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v73 = a4;
  v6 = CVPixelFormatDescriptionCreateWithPixelFormatType(0, a4);
  v7 = 0;
  if (v5 && v6)
  {
    v74 = v6;
    v8 = *MEMORY[0x24BDC5510];
    v69 = *MEMORY[0x24BDC5490];
    v116[0] = *MEMORY[0x24BDC5490];
    v116[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = *MEMORY[0x24BDC5570];
    v115 = *MEMORY[0x24BDC5570];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v115, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = *MEMORY[0x24BDC5420];
    v114 = *MEMORY[0x24BDC5420];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v114, 1);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = *MEMORY[0x24BDC5470];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v113, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_opt_new();
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v102;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v102 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is required for all color pixel formats"), v13);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v16, v13);

          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
      }
      while (v10);
    }

    if (objc_msgSend(a1, "formatDescriptionRepresentsYCbCr:", v74))
    {
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      v17 = v72;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v98;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v98 != v19)
              objc_enumerationMutation(v17);
            v21 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * j);
            objc_msgSend(v5, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 == 0;

            if (v23)
            {
              objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is required for all pixel formats with YCbCr sampling"), v21);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "setObject:forKeyedSubscript:", v24, v21);

            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v97, v111, 16);
        }
        while (v18);
      }

    }
    v79 = objc_msgSend((id)objc_opt_class(), "pixelFormatIs420Sampled:", v73);
    if (v79 && (objc_msgSend(a1, "formatDescriptionRepresentsYCbCr:", v74) & 1) == 0)
      __assert_rtn("+[MOVStreamIOUtility colorimetricWarningsForColorPixelBufferAttachments:pixelFormat:]", "MOVStreamIOUtility.mm", 663, "false");
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v77 = v71;
    v25 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v94;
      v27 = *MEMORY[0x24BDC5418];
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v94 != v26)
            objc_enumerationMutation(v77);
          v29 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * k);
          objc_msgSend(v5, "objectForKeyedSubscript:", v29);
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v30;
          if (v79)
          {
            if (v30)
              goto LABEL_38;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is required for all pixel formats with 4:2:0 subsampling"), v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v32, v29);
            goto LABEL_37;
          }
          if (v30)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is unexpectedly present for a pixel format without 4:2:0 subsampling"), v29);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v33, v29);

            if (objc_msgSend(v29, "isEqualToString:", v76))
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", v27);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = v34 == 0;

              if (!v35)
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is unexpectedly present for a pixel format without 4:2:0 subsampling"), v27);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v80, "setObject:forKeyedSubscript:", v32, v27);
LABEL_37:

              }
            }
          }
LABEL_38:

        }
        v25 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v93, v110, 16);
      }
      while (v25);
    }

    v36 = objc_msgSend((id)objc_opt_class(), "attachmentsRepresentInterlacedFields:", v5);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v67 = *MEMORY[0x24BDC5418];
    v108 = *MEMORY[0x24BDC5418];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v108, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v90;
      do
      {
        for (m = 0; m != v38; ++m)
        {
          if (*(_QWORD *)v90 != v39)
            objc_enumerationMutation(v37);
          v41 = *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * m);
          objc_msgSend(v5, "objectForKeyedSubscript:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v42)
            v43 = 0;
          else
            v43 = v36;
          if (v43 == 1)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is unexpectedly missing for a pixel format using interlaced scanning"), v41);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v44, v41);

          }
        }
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
      }
      while (v38);
    }

    v45 = objc_msgSend((id)objc_opt_class(), "pixelFormatIs422Sampled:", v73);
    if (v45 && (objc_msgSend(a1, "formatDescriptionRepresentsYCbCr:", v74) & 1) == 0)
      __assert_rtn("+[MOVStreamIOUtility colorimetricWarningsForColorPixelBufferAttachments:pixelFormat:]", "MOVStreamIOUtility.mm", 726, "false");
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v46 = v70;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v86;
      do
      {
        for (n = 0; n != v47; ++n)
        {
          if (*(_QWORD *)v86 != v48)
            objc_enumerationMutation(v46);
          v50 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * n);
          objc_msgSend(v5, "objectForKeyedSubscript:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (v51)
            v52 = v45;
          else
            v52 = 1;
          if ((v52 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is unexpectedly present for a pixel format without 4:2:2 subsampling"), v50);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v80, "setObject:forKeyedSubscript:", v53, v50);

          }
        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v85, v107, 16);
      }
      while (v47);
    }

    if (objc_msgSend(a1, "attachmentsContainsRec2020orRec2100ColorPrimaries:", v5))
    {
      if ((objc_msgSend(a1, "formatDescriptionRepresentsVideoRange:", v74) & 1) == 0)
      {
        objc_msgSend(v80, "objectForKeyedSubscript:", v69);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v54 == 0;

        if (v55)
          objc_msgSend(v80, "setObject:forKeyedSubscript:", CFSTR("Images with Rec 2020 or Rec 2100 color primaries are only defined for video range pixel formats."), v69);
      }
      if ((objc_msgSend(a1, "attachmentsContainsRec2020orRec2100ColorMatrices:", v5) & 1) == 0)
      {
        objc_msgSend(v80, "objectForKeyedSubscript:", v68);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v56 == 0;

        if (v57)
          objc_msgSend(v80, "setObject:forKeyedSubscript:", CFSTR("Images with Rec 2020 or Rec 2100 color primaries are only defined for attachments containing Rec 2020 or Rec 2100 YCbCr matrices."), v68);
      }
      if (v79 && (objc_msgSend(a1, "attachmentsContainTopLeftChromaLocations:", v5) & 1) == 0)
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v105[0] = v76;
        v105[1] = v67;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v105, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v81, v106, 16);
        if (v59)
        {
          v60 = *(_QWORD *)v82;
          do
          {
            for (ii = 0; ii != v59; ++ii)
            {
              if (*(_QWORD *)v82 != v60)
                objc_enumerationMutation(v58);
              v62 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * ii);
              objc_msgSend(v80, "objectForKeyedSubscript:", v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              if (v63)
              {

              }
              else
              {
                objc_msgSend(v5, "objectForKeyedSubscript:", v62);
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = v64 == 0;

                if (!v65)
                  objc_msgSend(v80, "setObject:forKeyedSubscript:", CFSTR("Images with Rec 2020 or Rec 2100 color primaries and 4:2:0 subsampling are only defined for attachments containing topLeft chroma locations."), v62);
              }
            }
            v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v81, v106, 16);
          }
          while (v59);
        }

      }
    }
    v7 = (void *)objc_msgSend(v80, "copy");

    v6 = v74;
  }

  return v7;
}

+ (id)colorimetricWarningsForGrayscalePixelBufferAttachments:(id)a3 pixelFormat:(unsigned int)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _QWORD v38[5];
  _QWORD v39[3];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v39[0] = *MEMORY[0x24BDC5510];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDC5570];
    v38[0] = *MEMORY[0x24BDC5490];
    v38[1] = v6;
    v7 = *MEMORY[0x24BDC5418];
    v38[2] = *MEMORY[0x24BDC5420];
    v38[3] = v7;
    v38[4] = *MEMORY[0x24BDC5470];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 5);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    obj = v26;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v33 != v10)
            objc_enumerationMutation(obj);
          v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13 == 0;

          if (v14)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is required for all grayscale pixel formats"), v12, v25);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v12);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v9);
    }

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v25;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          objc_msgSend(v5, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21 && (objc_msgSend(a1, "key:hasUnspecifiedValue:", v20, v21) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ attachment is unexpectedly present for a grayscale pixel format"), v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, v20);

          }
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v17);
    }

    v23 = (void *)objc_msgSend(v8, "copy");
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (BOOL)key:(id)a3 hasUnspecifiedValue:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  v8 = 1;
  if (v6 && v7)
  {
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC5490]))
    {
      CVColorPrimariesGetStringForIntegerCodePoint(2);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC5510]))
    {
      CVTransferFunctionGetStringForIntegerCodePoint(2);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDC5570]))
      {
        v10 = 0;
        goto LABEL_10;
      }
      CVYCbCrMatrixGetStringForIntegerCodePoint(2);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
LABEL_10:
    v8 = objc_msgSend(v10, "isEqualToString:", v6);

  }
  return v8;
}

+ (BOOL)isEncoderAvailableForEncoderType:(int)a3
{
  void *v3;
  char v4;
  __int128 v6;
  uint64_t v7;

  if (a3 > 8)
  {
    if (a3 == 9 || a3 == 12)
      return +[MOVStreamIOUtility isEncoderAvailableWithEncoderName:](MOVStreamIOUtility, "isEncoderAvailableWithEncoderName:", CFSTR("hvc1"));
    return 1;
  }
  if (!a3)
    return 0;
  if (a3 != 3)
    return 1;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v6 = xmmword_2106E4528;
  v4 = objc_msgSend(v3, "isOperatingSystemAtLeastVersion:", &v6);

  return v4;
}

+ (BOOL)isEncoderAvailableWithEncoderName:(id)a3
{
  id v3;
  uint64_t v4;
  const __CFArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  CFArrayRef listOfVideoEncodersOut;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  listOfVideoEncodersOut = 0;
  v4 = VTCopyVideoEncoderList(0, &listOfVideoEncodersOut);
  if ((_DWORD)v4)
  {
    v13 = (void *)MEMORY[0x24BDBCE88];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot retrieve available video encoder list, error %d"), v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = listOfVideoEncodersOut;
  v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x24BDF9990];
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToString:", v3))
        {
          CFRelease(listOfVideoEncodersOut);

          v11 = 1;
          goto LABEL_12;
        }

      }
      v6 = -[__CFArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v6)
        continue;
      break;
    }
  }

  CFRelease(listOfVideoEncodersOut);
  v11 = 0;
LABEL_12:

  return v11;
}

+ (BOOL)isHEVCEncoderType:(int)a3
{
  return (a3 < 0x24) & (0xC19F81EF0uLL >> a3);
}

+ (unint64_t)getDefaultBitrateForVideoDimension:(id)a3 atExpectedFramerate:(double)a4 forEncoderType:(int)a5
{
  float v5;

  v5 = a4;
  return (int)(float)((float)(flt_2106E4450[a5 == 9] * v5) * (float)(a3.var1 * a3.var0));
}

+ (id)valueWithCGAffineTransform:(CGAffineTransform *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", a3, "{CGAffineTransform=dddddd}");
}

+ (CGAffineTransform)CGAffineTransformValueFromNSValue:(SEL)a3
{
  return (CGAffineTransform *)objc_msgSend(a4, "getValue:", retstr);
}

+ (id)addTransform:(CGAffineTransform *)a3 toConfiguration:(id)a4
{
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  _OWORD v10[3];

  v5 = (void *)objc_msgSend(a4, "mutableCopy");
  v6 = *(_OWORD *)&a3->c;
  v10[0] = *(_OWORD *)&a3->a;
  v10[1] = v6;
  v10[2] = *(_OWORD *)&a3->tx;
  +[MOVStreamIOUtility valueWithCGAffineTransform:](MOVStreamIOUtility, "valueWithCGAffineTransform:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("VideoTransform"));

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

+ (id)addTrackTypeInfo:(unint64_t)a3 toConfiguration:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("VideoTrackTypeInfo"));

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

+ (id)addEncodingQuality:(double)a3 toConfiguration:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_msgSend(a4, "mutableCopy");
  v6 = (void *)MEMORY[0x24BDD16E0];
  +[MOVStreamIOUtility clampedQuality:](MOVStreamIOUtility, "clampedQuality:", a3);
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("EncodingQuality"));

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

+ (id)monochrome10bitHEVCLosslessEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B730;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)monochrome10bitHEVCLosslessEncoderConfigAllowFrameReordering:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "monochrome10bitHEVCLosslessEncoderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("AllowFrameReordering"));

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

+ (id)monochrome8bitHEVCLosslessEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B748;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)monochrome8bitHEVCLosslessEncoderConfigAllowFrameReordering:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "monochrome8bitHEVCLosslessEncoderConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("AllowFrameReordering"));

  v7 = (void *)objc_msgSend(v5, "copy");
  return v7;
}

+ (id)monochrome8bitHEVCEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B760;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)monochrome8bitHEVCEncoderConfigWithBitrate:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("ColorStreamBitrate");
  v7[0] = &unk_24CA5B760;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)monochrome10bitHEVCEncoderConfigWithQuality:(double)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("EncodingQuality");
  v7[0] = &unk_24CA5B778;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)monochrome8bitHEVCEncoderConfigWithQuality:(double)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("EncodingQuality");
  v7[0] = &unk_24CA5B760;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)colorHEVCEncoderConfigWithQuality:(double)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("EncodingQuality");
  v7[0] = &unk_24CA5B790;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)color8bitHEVCWithAlphaEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B7A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)color8bitHEVCWithAlphaEncoderConfigWithBitrate:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("ColorStreamBitrate");
  v7[0] = &unk_24CA5B7A8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)colorHEVCLosslessEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B7C0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorHEVCEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B790;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorWithAlphaLossless8bitHEVCEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B7D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorH264EncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B7F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorHEVCEncoderConfigWithBitrate:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("ColorStreamBitrate");
  v7[0] = &unk_24CA5B790;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)colorH264EncoderConfigWithBitrate:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("ColorStreamBitrate");
  v7[0] = &unk_24CA5B7F0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)slimEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B808;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)slimXEncoderConfig
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("StreamEncoderType");
  v3[1] = CFSTR("UseSlimXCompression");
  v4[0] = &unk_24CA5B808;
  v4[1] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)jpegEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B820;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)jpegEncoderConfigWithQuality:(double)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("EncodingQuality");
  v7[0] = &unk_24CA5B820;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)configWithEncoderType:(int)a3
{
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("StreamEncoderType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)noneEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B838;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)sampleBufferConfigWithPixelFormat:(unsigned int)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("PixelFormat");
  v7[0] = &unk_24CA5B838;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)audioNoneEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B850;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)customEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B868;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)customConfigWithOutputSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("outputSettings must not be nil."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8[0] = CFSTR("StreamEncoderType");
  v8[1] = CFSTR("CustomOutputSettings");
  v9[0] = &unk_24CA5B880;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)customEncoderConfigWithEmbeddedConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCA98], CFSTR("Embedded configuration must not be nil."), 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
  v8[0] = CFSTR("StreamEncoderType");
  v8[1] = CFSTR("CustomEncoderConfig");
  v9[0] = &unk_24CA5B868;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stereoConfigurationWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 frameRate:(double)a6 additionalCompressionProperties:(id)a7
{
  +[MOVStreamIOUtility stereoConfigurationWidth:height:pixelFormat:frameRate:leftAndRightViewIDs:additionalCompressionProperties:](MOVStreamIOUtility, "stereoConfigurationWidth:height:pixelFormat:frameRate:leftAndRightViewIDs:additionalCompressionProperties:", a3, a4, *(_QWORD *)&a5, 0, a7, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stereoConfigurationWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unsigned int)a5 frameRate:(double)a6 leftAndRightViewIDs:(id)a7 additionalCompressionProperties:(id)a8
{
  uint64_t v10;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[2];
  _QWORD v39[4];

  v10 = *(_QWORD *)&a5;
  v39[2] = *MEMORY[0x24BDAC8D0];
  v31 = a7;
  v13 = a8;
  v14 = objc_alloc(MEMORY[0x24BDBCED8]);
  v15 = *MEMORY[0x24BDF9260];
  v38[0] = *MEMORY[0x24BDF92A8];
  v38[1] = v15;
  v39[0] = &unk_24CA5C0A8;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithDictionary:", v17);

  if (v31 && objc_msgSend(v31, "count") == 2)
  {
    objc_msgSend(v18, "setObject:forKey:", &unk_24CA5C0A8, *MEMORY[0x24BDF92B0]);
    objc_msgSend(v18, "setObject:forKey:", v31, *MEMORY[0x24BDF92A0]);
  }
  v19 = MEMORY[0x24BDBD1B8];
  if (!v13)
    v13 = (id)MEMORY[0x24BDBD1B8];
  v20 = *MEMORY[0x24BDB2268];
  v37[0] = *MEMORY[0x24BDB22A0];
  v21 = *MEMORY[0x24BDB2368];
  v36[0] = v20;
  v36[1] = v21;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v22;
  v36[2] = *MEMORY[0x24BDB2310];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = *MEMORY[0x24BDB22C8];
  v37[2] = v23;
  v37[3] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = *MEMORY[0x24BDC56B8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v25;
  v34[1] = *MEMORY[0x24BDC5708];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v26;
  v34[2] = *MEMORY[0x24BDC5650];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34[3] = *MEMORY[0x24BDC5668];
  v35[2] = v27;
  v35[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = CFSTR("StreamEncoderType");
  v32[1] = CFSTR("CustomOutputSettings");
  v33[0] = &unk_24CA5B880;
  v33[1] = v24;
  v32[2] = CFSTR("AdditionalCompressionProperties");
  v32[3] = CFSTR("TaggedPixelBufferGroupAdaptorPixelBufferAttributes");
  v33[2] = v13;
  v33[3] = v28;
  v32[4] = CFSTR("StereoVideoEncoding");
  v33[4] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)monochrome10bitHEVCEncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B778;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)monochrome10bitHEVCEncoderConfigWithBitrate:(unint64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("ColorStreamBitrate");
  v7[0] = &unk_24CA5B778;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)proRes4444EncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B8C8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)proRes422EncoderConfig
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("StreamEncoderType");
  v4[0] = &unk_24CA5B8E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)proRes422EncoderConfigWithQuality:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("StreamEncoderType");
  v6[1] = CFSTR("ProResEncodingQuality");
  v7[0] = &unk_24CA5B8E0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)proRes4444EncoderConfigWithHighQuality
{
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("StreamEncoderType");
  v3[1] = CFSTR("ProResEncodingQuality");
  v4[0] = &unk_24CA5B8C8;
  v4[1] = &unk_24CA5B8F8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 lossless:(BOOL)a4 chromaSampling:(int64_t)a5 error:(id *)a6
{
  void *v6;
  void *v8;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 8)
  {
    if (a5 == 2)
    {
      if (a3 == 8)
      {
        if (a4)
        {
          v16 = CFSTR("StreamEncoderType");
          v17 = &unk_24CA5B9A0;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1, a6);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = CFSTR("StreamEncoderType");
          v15 = &unk_24CA5B9B8;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1, a6);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a4)
      {
        v12 = CFSTR("StreamEncoderType");
        v13 = &unk_24CA5B9D0;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1, a6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("StreamEncoderType");
        v11 = &unk_24CA5B9E8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1, a6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else if (a5 == 1)
    {
      if (a3 == 8)
      {
        if (a4)
        {
          v24 = CFSTR("StreamEncoderType");
          v25 = &unk_24CA5B940;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1, a6);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = CFSTR("StreamEncoderType");
          v23 = &unk_24CA5B958;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1, a6);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a4)
      {
        v20 = CFSTR("StreamEncoderType");
        v21 = &unk_24CA5B970;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1, a6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = CFSTR("StreamEncoderType");
        v19 = &unk_24CA5B988;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1, a6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      if (a5)
        +[MOVStreamIOUtility colorRecordingConfigBitDepth:lossless:chromaSampling:error:].cold.1();
      if (a3 == 8)
      {
        if (a4)
        {
          v32 = CFSTR("StreamEncoderType");
          v33[0] = &unk_24CA5B7C0;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1, a6);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = CFSTR("StreamEncoderType");
          v31 = &unk_24CA5B790;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1, a6);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (a4)
      {
        v28 = CFSTR("StreamEncoderType");
        v29 = &unk_24CA5B910;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1, a6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v26 = CFSTR("StreamEncoderType");
        v27 = &unk_24CA5B928;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1, a6);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported bit depth (%zu)."), a4, a5, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateStreamError:message:code:", a6, v8, 28);

    v6 = 0;
  }
  return v6;
}

+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 bitrate:(unint64_t)a4 chromaSampling:(int64_t)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "colorRecordingConfigBitDepth:lossless:chromaSampling:error:", a3, 0, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("ColorStreamBitrate"));

  return v8;
}

+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 quality:(double)a4 chromaSampling:(int64_t)a5 error:(id *)a6
{
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "colorRecordingConfigBitDepth:lossless:chromaSampling:error:", a3, 0, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("EncodingQuality"));

  return v8;
}

+ (id)colorRecordingConfigBitDepth:(unint64_t)a3 chromaSampling:(int64_t)a4 error:(id *)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "colorRecordingConfigBitDepth:lossless:chromaSampling:error:", a3, 0, a4, a5);
}

+ (BOOL)isKeyFrame:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  void *v6;
  const __CFString *v7;
  const __CFArray *SampleAttachmentsArray;
  const __CFDictionary *ValueAtIndex;
  void *value;

  if (CMSampleBufferGetImageBuffer(a3))
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = CFSTR("decoding is set up for this sample buffer. Cannot tell whether it's a key frame or not");
LABEL_3:
    objc_msgSend(v6, "populateStreamError:message:code:", a4, v7, 0);
    return 0;
  }
  SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a3, 1u);
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(SampleAttachmentsArray, 0);
  value = 0;
  if (!ValueAtIndex)
  {
    v6 = (void *)MEMORY[0x24BDD1540];
    v7 = CFSTR("This sample buffer doesn't have any attachment. Cannot tell whether it's a key frame or not");
    goto LABEL_3;
  }
  return !CFDictionaryGetValueIfPresent(ValueAtIndex, (const void *)*MEMORY[0x24BDC0CC0], (const void **)&value)
      || value == (void *)*MEMORY[0x24BDBD268];
}

+ (BOOL)isSlimXEncodedTrack:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t i;
  const opaqueCMFormatDescription *v8;
  const __CFDictionary *Extension;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "formatDescriptions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    v6 = (const __CFString *)*MEMORY[0x24BDC0B78];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v8 = *(const opaqueCMFormatDescription **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (CMFormatDescriptionGetMediaSubType(v8) == 1936484717)
        {
          Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(v8, v6);
          if (Extension)
          {
            if (CFDictionaryGetValue(Extension, CFSTR("slmC")))
            {
              LOBYTE(v4) = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

+ (int64_t)chromaSamplingFromMediaFormatDescription:(opaqueCMFormatDescription *)a3
{
  const __CFDictionary *Extension;

  if (CMFormatDescriptionGetMediaSubType(a3) == 1752589105
    && (Extension = (const __CFDictionary *)CMFormatDescriptionGetExtension(a3, (CFStringRef)*MEMORY[0x24BDC0B78])) != 0
    && CFDictionaryGetValue(Extension, CFSTR("hvcC"))
    && !FigHEVCBridge_GetHEVCParameterSetAtIndex()
    && !FigHEVCBridge_GetSPSChromaFormatAndBitDepths())
  {
    return 3;
  }
  else
  {
    return 4;
  }
}

+ (int64_t)chromaSamplingForTrack:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "formatDescriptions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v3);
      v7 = objc_msgSend((id)objc_opt_class(), "chromaSamplingFromMediaFormatDescription:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6));
      if (v7 != 4)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v7 = 4;
  }

  return v7;
}

+ (opaqueCMFormatDescription)createTimeCode64FormatDescriptionWithFrameRate:(double)a3 dropFrame:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint32_t v8;
  const __CFAllocator *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  CMTime frameDuration;
  CMTimeCodeFormatDescriptionRef formatDescriptionOut;

  v6 = a4;
  formatDescriptionOut = 0;
  if (a4)
    v8 = 3;
  else
    v8 = 2;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CMTimeMake(&frameDuration, 100, (int)(a3 * 100.0));
  v10 = CMTimeCodeFormatDescriptionCreate(v9, 0x74633634u, &frameDuration, vcvtpd_u64_f64(a3), v8, 0, &formatDescriptionOut);
  if (!(_DWORD)v10)
    return formatDescriptionOut;
  if (a5)
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create TimeCode64 FormatDescription with fps %f drop frame %@. Error: %d"), *(_QWORD *)&a3, v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v12, 8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (opaqueCMFormatDescription)createTimeCode32FormatDescriptionWithFrameRate:(double)a3 dropFrame:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  uint32_t v8;
  const __CFAllocator *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  CMTime frameDuration;
  CMTimeCodeFormatDescriptionRef formatDescriptionOut;

  v6 = a4;
  formatDescriptionOut = 0;
  if (a4)
    v8 = 3;
  else
    v8 = 2;
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CMTimeMake(&frameDuration, 100, (int)(a3 * 100.0));
  v10 = CMTimeCodeFormatDescriptionCreate(v9, 0x746D6364u, &frameDuration, vcvtpd_u64_f64(a3), v8, 0, &formatDescriptionOut);
  if (!(_DWORD)v10)
    return formatDescriptionOut;
  if (a5)
  {
    v11 = CFSTR("NO");
    if (v6)
      v11 = CFSTR("YES");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create TimeCode32 FormatDescription with fps %f drop frame %@. Error: %d"), *(_QWORD *)&a3, v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v12, 8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (opaqueCMSampleBuffer)createTimecodeSampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6
{
  uint64_t MediaSubType;
  void *v12;
  __int128 v13;
  int64_t var3;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  int64_t v18;
  __int128 v19;
  uint64_t v20;

  MediaSubType = CMFormatDescriptionGetMediaSubType(a4);
  if ((_DWORD)MediaSubType == 1952658996)
  {
    v15 = *(_OWORD *)&a3->subframes;
    v16 = *(_QWORD *)&a3->hours;
    v13 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    return +[MOVStreamIOUtility createTimecode64SampleBufferWithSMPTETime:formatDescription:pts:error:](MOVStreamIOUtility, "createTimecode64SampleBufferWithSMPTETime:formatDescription:pts:error:", &v15, a4, &v13, a6);
  }
  else if ((_DWORD)MediaSubType == 1953325924)
  {
    v19 = *(_OWORD *)&a3->subframes;
    v20 = *(_QWORD *)&a3->hours;
    v17 = *(_OWORD *)&a5->var0;
    v18 = a5->var3;
    return +[MOVStreamIOUtility createTimecode32SampleBufferWithSMPTETime:formatDescription:pts:error:](MOVStreamIOUtility, "createTimecode32SampleBufferWithSMPTETime:formatDescription:pts:error:", &v19, a4, &v17, a6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TimeCode format (%d) not supported."), MediaSubType);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a6, v12, 12);

    return 0;
  }
}

+ (opaqueCMSampleBuffer)createTimecode32SampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6
{
  const __CFAllocator *v8;
  OSStatus v9;
  OpaqueCMBlockBuffer *v10;
  BOOL v11;
  __int128 v12;
  CMTimeEpoch v13;
  __int128 v14;
  CMTimeEpoch var3;
  signed int FrameQuanta;
  size_t sampleSizeArray;
  CMSampleTimingInfo v19;
  CVSMPTETime v20;
  int sourceBytes;
  CMBlockBufferRef blockBufferOut;
  CMSampleBufferRef v23;

  blockBufferOut = 0;
  v23 = 0;
  v20 = *a3;
  sourceBytes = +[MOVStreamIOUtility frameNumber32ForTimecode:usingFormatDescription:](MOVStreamIOUtility, "frameNumber32ForTimecode:usingFormatDescription:", &v20, a4, a5, a6);
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 4uLL, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 4uLL, 1u, &blockBufferOut);
  v10 = blockBufferOut;
  if (v9)
    v11 = 1;
  else
    v11 = blockBufferOut == 0;
  if (v11)
  {
    NSLog(CFSTR("Could not create block buffer"));
    v10 = blockBufferOut;
  }
  if (CMBlockBufferReplaceDataBytes(&sourceBytes, v10, 0, 4uLL))
    NSLog(CFSTR("Could not write into block buffer"));
  v12 = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 48);
  *(_OWORD *)&v19.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 32);
  *(_OWORD *)&v19.decodeTimeStamp.value = v12;
  v13 = *(_QWORD *)(MEMORY[0x24BDC0DC0] + 64);
  v14 = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 16);
  *(_OWORD *)&v19.duration.value = *MEMORY[0x24BDC0DC0];
  *(_OWORD *)&v19.duration.epoch = v14;
  *(_OWORD *)&v19.presentationTimeStamp.value = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  v19.decodeTimeStamp.epoch = v13;
  v19.presentationTimeStamp.epoch = var3;
  FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a4);
  CMTimeMake(&v19.duration, (uint64_t)(1.0 / (double)FrameQuanta * (double)a5->var1), a5->var1);
  sampleSizeArray = 4;
  if (CMSampleBufferCreate(v8, blockBufferOut, 1u, 0, 0, a4, 1, 1, &v19, 1, &sampleSizeArray, &v23) || !v23)
    NSLog(CFSTR("Could not create block buffer"));
  CFRelease(blockBufferOut);
  return v23;
}

+ (opaqueCMSampleBuffer)createTimecode64SampleBufferWithSMPTETime:(CVSMPTETime *)a3 formatDescription:(opaqueCMFormatDescription *)a4 pts:(id *)a5 error:(id *)a6
{
  const __CFAllocator *v8;
  OSStatus v9;
  OpaqueCMBlockBuffer *v10;
  BOOL v11;
  __int128 v12;
  CMTimeEpoch v13;
  __int128 v14;
  CMTimeEpoch var3;
  signed int FrameQuanta;
  size_t sampleSizeArray;
  CMSampleTimingInfo v19;
  CVSMPTETime v20;
  int64_t sourceBytes;
  CMBlockBufferRef blockBufferOut;
  CMSampleBufferRef v23;

  blockBufferOut = 0;
  v23 = 0;
  v20 = *a3;
  sourceBytes = +[MOVStreamIOUtility frameNumber64ForTimecode:usingFormatDescription:](MOVStreamIOUtility, "frameNumber64ForTimecode:usingFormatDescription:", &v20, a4, a5, a6);
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v9 = CMBlockBufferCreateWithMemoryBlock((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 8uLL, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 8uLL, 1u, &blockBufferOut);
  v10 = blockBufferOut;
  if (v9)
    v11 = 1;
  else
    v11 = blockBufferOut == 0;
  if (v11)
  {
    NSLog(CFSTR("Could not create block buffer"));
    v10 = blockBufferOut;
  }
  if (CMBlockBufferReplaceDataBytes(&sourceBytes, v10, 0, 8uLL))
    NSLog(CFSTR("Could not write into block buffer"));
  v12 = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 48);
  *(_OWORD *)&v19.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 32);
  *(_OWORD *)&v19.decodeTimeStamp.value = v12;
  v13 = *(_QWORD *)(MEMORY[0x24BDC0DC0] + 64);
  v14 = *(_OWORD *)(MEMORY[0x24BDC0DC0] + 16);
  *(_OWORD *)&v19.duration.value = *MEMORY[0x24BDC0DC0];
  *(_OWORD *)&v19.duration.epoch = v14;
  *(_OWORD *)&v19.presentationTimeStamp.value = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  v19.decodeTimeStamp.epoch = v13;
  v19.presentationTimeStamp.epoch = var3;
  FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a4);
  CMTimeMake(&v19.duration, (uint64_t)(1.0 / (double)FrameQuanta * (double)a5->var1), a5->var1);
  sampleSizeArray = 8;
  if (CMSampleBufferCreate(v8, blockBufferOut, 1u, 0, 0, a4, 1, 1, &v19, 1, &sampleSizeArray, &v23) || !v23)
    NSLog(CFSTR("Could not create block buffer"));
  CFRelease(blockBufferOut);
  return v23;
}

+ (CVSMPTETime)timecode32ForSampleBuffer:(SEL)a3 dropFrame:(opaqueCMSampleBuffer *)a4
{
  OpaqueCMBlockBuffer *DataBuffer;
  CVSMPTETime *result;
  CVSMPTETime *v10;
  char *v11;
  char *dataPointerOut;
  size_t totalLengthOut;
  size_t lengthAtOffsetOut;

  DataBuffer = CMSampleBufferGetDataBuffer(a4);
  result = (CVSMPTETime *)CMSampleBufferGetFormatDescription(a4);
  if (!DataBuffer)
    goto LABEL_8;
  v10 = result;
  if (!result)
    goto LABEL_8;
  totalLengthOut = 0;
  lengthAtOffsetOut = 0;
  dataPointerOut = 0;
  if (CMBlockBufferGetDataPointer(DataBuffer, 0, &lengthAtOffsetOut, &totalLengthOut, &dataPointerOut))
  {
    NSLog(CFSTR("Could not get data from block buffer"));
LABEL_8:
    *(_QWORD *)&retstr->subframes = 0;
    *(_QWORD *)&retstr->type = 0;
    *(_QWORD *)&retstr->hours = 0;
    return result;
  }
  result = (CVSMPTETime *)CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v10);
  if ((_DWORD)result != 1953325924)
    goto LABEL_8;
  v11 = dataPointerOut;
  *(_QWORD *)&retstr->type = 0;
  *(_QWORD *)&retstr->hours = 0;
  *(_QWORD *)&retstr->subframes = 0;
  +[MOVStreamIOUtility timecodeForFrameNumber32:formatDescription:](MOVStreamIOUtility, "timecodeForFrameNumber32:formatDescription:", *(unsigned int *)v11, v10);
  result = (CVSMPTETime *)CMTimeCodeFormatDescriptionGetTimeCodeFlags((CMTimeCodeFormatDescriptionRef)v10);
  if (a5)
    *a5 = result & 1;
  return result;
}

+ (id)qtTrackNameForAssociatedAttachmentsTrack:(id)a3
{
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("_attachments"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)qtTrackNameForAssociatedTimeCodeTrack:(id)a3
{
  objc_msgSend(a3, "stringByAppendingString:", CFSTR("_timecode"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (opaqueCMFormatDescription)createL010FormatDescriptionFromL016FormatDescription:(opaqueCMFormatDescription *)a3
{
  unint64_t Dimensions;
  void *v5;
  void *v6;
  int v7;
  int v8;
  __CVBuffer *v9;
  opaqueCMFormatDescription *v10;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  CMFormatDescriptionGetExtensions(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("CVBytesPerRow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");
  if (v7 >= 0)
    v8 = v7;
  else
    v8 = v7 + 1;
  v9 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Dimensions, HIDWORD(Dimensions), 0, ((v8 >> 1) - Dimensions), 1278226736, 1, 1);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x24BDC5510], (CFTypeRef)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC5510]), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x24BDC5570], (CFTypeRef)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC5570]), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x24BDC5490], (CFTypeRef)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC5490]), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x24BDC5418], (CFTypeRef)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC5418]), kCVAttachmentMode_ShouldPropagate);
  CVBufferSetAttachment(v9, (CFStringRef)*MEMORY[0x24BDC5420], (CFTypeRef)objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC5420]), kCVAttachmentMode_ShouldPropagate);
  formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, &formatDescriptionOut);
  CVPixelBufferRelease(v9);
  v10 = formatDescriptionOut;

  return v10;
}

+ (opaqueCMFormatDescription)createL010FormatDescriptionFromRawBayerFormatDescription:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions;
  void *v5;
  void *v6;
  unint64_t v7;
  __CVBuffer *v8;
  opaqueCMFormatDescription *v9;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  CMFormatDescriptionGetExtensions(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("CVBytesPerRow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize](MOVStreamIOUtility, "getPreferredBytesPerRowAlignmentSize");
  v8 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Dimensions, HIDWORD(*(unint64_t *)&Dimensions), 0, (unint64_t)(int)((int)objc_msgSend(v6, "intValue") % v7) >> 1, 1278226736, v7, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, &formatDescriptionOut);
  CVPixelBufferRelease(v8);
  v9 = formatDescriptionOut;

  return v9;
}

+ (opaqueCMFormatDescription)createxf20FormatDescriptionFromRawBayerFormatDescription:(opaqueCMFormatDescription *)a3 usingFirstPlaneOnly:(BOOL)a4
{
  _BOOL4 v4;
  CMVideoDimensions Dimensions;
  int32_t height;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  __CVBuffer *v13;
  opaqueCMFormatDescription *v14;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  v4 = a4;
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  if (Dimensions.height >= 0)
    height = Dimensions.height;
  else
    height = Dimensions.height + 1;
  v8 = height >> 1;
  if (v4)
    v9 = Dimensions.height;
  else
    v9 = v8;
  CMFormatDescriptionGetExtensions(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("CVBytesPerRow"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize](MOVStreamIOUtility, "getPreferredBytesPerRowAlignmentSize");
  v13 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Dimensions, v9, 0, (unint64_t)(int)((int)objc_msgSend(v11, "intValue") % v12) >> 1, 2019963440, v12, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v13, &formatDescriptionOut);
  CVPixelBufferRelease(v13);
  v14 = formatDescriptionOut;

  return v14;
}

+ (double)bytesPerPixelForFormat:(unsigned int)a3
{
  const __CFDictionary *v4;
  NSObject *v5;
  double BytesPerPixel;
  uint8_t v8[16];
  CVPixelBufferRef pixelBufferOut;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  pixelBufferOut = 0;
  v10 = *MEMORY[0x24BDC5668];
  v11[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0x400uLL, 0x300uLL, a3, v4, &pixelBufferOut);
  if (CVPixelBufferIsPlanar(pixelBufferOut))
  {
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_ERROR, "bytesPerPixelForFormat requires non-planar buffer.", v8, 2u);
    }

    BytesPerPixel = 0.0;
    CVPixelBufferRelease(pixelBufferOut);
  }
  else
  {
    BytesPerPixel = MIOCVPixelBufferGetBytesPerPixel(pixelBufferOut);
    CVPixelBufferRelease(pixelBufferOut);
  }

  return BytesPerPixel;
}

+ (opaqueCMFormatDescription)createL008FormatDescriptionFromNonPlanarFormatDescription:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions;
  uint64_t MediaSubType;
  double BytesPerPixelOfPlaneFromLookupForFormat;
  const __CFDictionary *v7;
  size_t v8;
  size_t v9;
  const __CFAllocator *v10;
  opaqueCMFormatDescription *v11;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CVPixelBufferRef pixelBufferOut;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  BytesPerPixelOfPlaneFromLookupForFormat = MIOCVPixelBufferGetBytesPerPixelOfPlaneFromLookupForFormat(MediaSubType, 0);
  pixelBufferOut = 0;
  v15 = *MEMORY[0x24BDC5668];
  v16[0] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v8 = *(uint64_t *)&Dimensions >> 32;
  v9 = Dimensions.width * (unint64_t)BytesPerPixelOfPlaneFromLookupForFormat;
  v10 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v9, v8, 0x4C303038u, v7, &pixelBufferOut);
  formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer(v10, pixelBufferOut, &formatDescriptionOut);
  CVPixelBufferRelease(pixelBufferOut);
  v11 = formatDescriptionOut;

  return v11;
}

+ (opaqueCMFormatDescription)createL008FormatDescriptionFromCompandedRawBayerFormatDescription:(opaqueCMFormatDescription *)a3
{
  CMVideoDimensions Dimensions;
  void *v5;
  void *v6;
  unint64_t v7;
  __CVBuffer *v8;
  opaqueCMFormatDescription *v9;
  CMVideoFormatDescriptionRef formatDescriptionOut;

  Dimensions = CMVideoFormatDescriptionGetDimensions(a3);
  CMFormatDescriptionGetExtensions(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("CVBytesPerRow"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[MOVStreamIOUtility getPreferredBytesPerRowAlignmentSize](MOVStreamIOUtility, "getPreferredBytesPerRowAlignmentSize");
  v8 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Dimensions, HIDWORD(*(unint64_t *)&Dimensions), 0, ((int)objc_msgSend(v6, "intValue") % v7), 1278226488, v7, +[MOVStreamIOUtility getPreferredPlaneAlignmentSize](MOVStreamIOUtility, "getPreferredPlaneAlignmentSize"));
  formatDescriptionOut = 0;
  CMVideoFormatDescriptionCreateForImageBuffer((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, &formatDescriptionOut);
  CVPixelBufferRelease(v8);
  v9 = formatDescriptionOut;

  return v9;
}

+ (id)getJsonFriendlyCopy:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v3;
    v4 = (id)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v15;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOVStreamIOUtility getJsonFriendlyCopy:](MOVStreamIOUtility, "getJsonFriendlyCopy:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v4, "setValue:forKey:", v11, v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v3, "doubleValue");
        v4 = 0;
        if (fabs(v13) == INFINITY)
          goto LABEL_23;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v4 = 0;
            goto LABEL_23;
          }
        }
      }
      v4 = v3;
      goto LABEL_23;
    }
    v12 = v3;
    if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v12) & 1) != 0)
      v4 = v12;
    else
      v4 = 0;

  }
LABEL_23:

  return v4;
}

+ (BOOL)isValidJSONObject:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  BOOL v15;
  unsigned int v16;
  void *v17;
  void *v18;
  BOOL v19;
  NSObject *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v23 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = v5;
    if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:") & 1) == 0)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = v22;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v6);
            v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v23, v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKeyedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = +[MOVStreamIOUtility isValidJSONObject:path:](MOVStreamIOUtility, "isValidJSONObject:path:", v12, v11);

            if (!v13)
            {

              goto LABEL_26;
            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
          if (v7)
            continue;
          break;
        }
      }

    }
    goto LABEL_17;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v5;
    if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v14) & 1) == 0)
    {
      v16 = 0;
      while (objc_msgSend(v14, "count") > (unint64_t)v16)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@[%d]"), v23, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = +[MOVStreamIOUtility isValidJSONObject:path:](MOVStreamIOUtility, "isValidJSONObject:path:", v18, v17);

        ++v16;
        if (!v19)
        {

          goto LABEL_26;
        }
      }
    }

    goto LABEL_17;
  }
  if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v5) & 1) != 0)
  {
LABEL_17:
    v15 = 1;
    goto LABEL_27;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v29 = v23;
    _os_log_impl(&dword_210675000, v20, OS_LOG_TYPE_ERROR, "Can't serialize object as JSON: %{public}@", buf, 0xCu);
  }

LABEL_26:
  v15 = 0;
LABEL_27:

  return v15;
}

+ (id)getPlistFriendlyCopyOf:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v3;
    v4 = (id)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = v19;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[MOVStreamIOUtility getPlistFriendlyCopyOf:](MOVStreamIOUtility, "getPlistFriendlyCopyOf:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v4, "setValue:forKey:", v11, v9);

        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v6);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v3;
      v4 = (id)objc_opt_new();
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v21;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v13);
            +[MOVStreamIOUtility getPlistFriendlyCopyOf:](MOVStreamIOUtility, "getPlistFriendlyCopyOf:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v4, "addObject:", v17);

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        }
        while (v14);
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v4 = v3;
      }
      else
      {
        v4 = 0;
      }
    }
  }

  return v4;
}

+ (BOOL)verifyExactBytesPerRow:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 pixelFormat:(unsigned int)a6
{
  uint64_t v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  const __CFDictionary *v12;
  const __CFAllocator *v13;
  size_t PlaneCount;
  void *v15;
  unint64_t i;
  void *v17;
  uint64_t v18;
  __CFDictionary *v19;
  size_t v20;
  BOOL v21;
  uint64_t v22;
  size_t BytesPerRowOfPlane;
  void *v24;
  BOOL v25;
  void *v26;
  uint64_t v27;
  __CVBuffer *v28;
  size_t BytesPerRow;
  const __CFDictionary *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE pixelBufferOut[12];
  _QWORD v35[2];

  v6 = *(_QWORD *)&a6;
  v35[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
LABEL_5:
    v11 = v10;
    *(_QWORD *)pixelBufferOut = 0;
    v32 = *MEMORY[0x24BDC5668];
    v33 = MEMORY[0x24BDBD1B8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v31 = v12;
    CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], a4, a5, v6, v12, (CVPixelBufferRef *)pixelBufferOut);
    PlaneCount = CVPixelBufferGetPlaneCount(*(CVPixelBufferRef *)pixelBufferOut);
    if (PlaneCount)
    {
      if (-[NSObject count](v11, "count") < PlaneCount)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", PlaneCount);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i != PlaneCount; ++i)
        {
          -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", i % -[NSObject count](v11, "count"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v17);

        }
        v18 = objc_msgSend(v15, "copy");

        v11 = v18;
        v12 = v31;
      }
      v19 = +[MIOPixelBufferUtility createPixelBufferAttributesWithWidth:height:pixelFormat:bytesPerRows:](MIOPixelBufferUtility, "createPixelBufferAttributesWithWidth:height:pixelFormat:bytesPerRows:", a4, a5, v6, v11);
      CVPixelBufferRelease(*(CVPixelBufferRef *)pixelBufferOut);
      CVPixelBufferCreate(v13, a4, a5, v6, v19, (CVPixelBufferRef *)pixelBufferOut);
      CFRelease(v19);
      if (*(_QWORD *)pixelBufferOut)
      {
        v20 = 0;
        v21 = 0;
        if (PlaneCount <= 1)
          v22 = 1;
        else
          v22 = PlaneCount;
        do
        {
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(*(CVPixelBufferRef *)pixelBufferOut, v20);
          -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = BytesPerRowOfPlane == objc_msgSend(v24, "unsignedLongValue");

          if (!v25)
            break;
          v21 = PlaneCount <= ++v20;
        }
        while (v22 != v20);
        v12 = v31;
        CVPixelBufferRelease(*(CVPixelBufferRef *)pixelBufferOut);
        goto LABEL_20;
      }
    }
    else
    {
      CVPixelBufferRelease(*(CVPixelBufferRef *)pixelBufferOut);
      -[NSObject objectAtIndexedSubscript:](v11, "objectAtIndexedSubscript:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "unsignedLongValue");

      v28 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:pixelFormat:bytesPerRow:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:pixelFormat:bytesPerRow:", a4, a5, v6, v27);
      *(_QWORD *)pixelBufferOut = v28;
      if (v28)
      {
        BytesPerRow = CVPixelBufferGetBytesPerRow(v28);
        CVPixelBufferRelease(*(CVPixelBufferRef *)pixelBufferOut);
        v21 = BytesPerRow == v27;
LABEL_20:

        goto LABEL_24;
      }
    }
    v21 = 0;
    goto LABEL_20;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)pixelBufferOut = 138543362;
    *(_QWORD *)&pixelBufferOut[4] = v9;
    _os_log_impl(&dword_210675000, v11, OS_LOG_TYPE_ERROR, "Invalid ExactBytesPerRow value type: %{public}@", pixelBufferOut, 0xCu);
  }
  v21 = 0;
LABEL_24:

  return v21;
}

+ (id)plistSerializedObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "plistFriendlyCopyOf:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v6, 200, 0, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unsupported data type, cannot serialize object %@."), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v7, 8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return a4;
}

+ (id)plistDeserializedObject:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v8;

  v5 = a3;
  if (objc_msgSend(MEMORY[0x24BDD1770], "propertyList:isValidForFormat:", v5, 200))
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 0, &v8, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", CFSTR("Unsupported raw data format, cannot deserialize object."), 8);
    v6 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (unsigned)guessPixelFormatForTrack:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v3 = a3;
  v4 = 0;
  while (1)
  {
    objc_msgSend(v3, "formatDescriptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6 <= v4)
      break;
    objc_msgSend(v3, "formatDescriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[MOVStreamIOUtility guessPixelFormatFromFormatDescription:](MOVStreamIOUtility, "guessPixelFormatFromFormatDescription:", v8);

    ++v4;
    if (v9)
      goto LABEL_6;
  }
  v9 = 0;
LABEL_6:

  return v9;
}

+ (unsigned)guessPixelFormatFromFormatDescription:(opaqueCMFormatDescription *)a3
{
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  int v11;
  BOOL v12;
  int v13;
  int v14;

  if (!a3)
    return 0;
  CMFormatDescriptionGetExtensions(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = +[MOVStreamIOUtility chromaSamplingFromMediaFormatDescription:](MOVStreamIOUtility, "chromaSamplingFromMediaFormatDescription:", a3);
    objc_msgSend(v4, "objectForKey:", CFSTR("BitsPerComponent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKey:", CFSTR("FullRangeVideo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");
    v10 = 875704438;

    switch(v5)
    {
      case 0:
      case 4:
        v11 = 875704422;
        v12 = v9 == 1;
        if (v9 != 1)
          v11 = 875704438;
        v13 = 2016686640;
        v14 = 2019963440;
        goto LABEL_19;
      case 1:
        v11 = 875704934;
        v12 = v9 == 1;
        if (v9 != 1)
          v11 = 875704950;
        v13 = 2016686642;
        v14 = 2019963442;
        goto LABEL_19;
      case 2:
        if (v9 == 1)
          v11 = 875836518;
        else
          v11 = 875836534;
        v13 = 2016687156;
        v14 = 2019963956;
        v12 = v9 == 1;
LABEL_19:
        if (v12)
          v13 = v14;
        if (v7 == 10)
          v10 = v13;
        else
          v10 = v11;
        break;
      case 3:
        if (v7 == 10)
          v10 = 1278226736;
        else
          v10 = 1278226488;
        break;
      default:
        break;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (unsigned)detectPixelFormatForAsset:(id)a3 videoTrackId:(int)a4 error:(id *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CMVideoDimensions Dimensions;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  opaqueCMSampleBuffer *v20;
  opaqueCMSampleBuffer *v21;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v23;
  uint64_t PixelFormatType;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD v35[8];
  _QWORD v36[8];
  _QWORD v37[2];
  _QWORD v38[4];

  v6 = *(_QWORD *)&a4;
  v38[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "trackWithTrackID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "formatDescriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v9, "formatDescriptions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)v13);
      v37[0] = *MEMORY[0x24BDC5708];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", Dimensions);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = v15;
      v37[1] = *MEMORY[0x24BDC5650];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", HIDWORD(*(unint64_t *)&Dimensions));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[1] = v16;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDB23D0], "assetReaderTrackOutputWithTrack:outputSettings:", v9, v34);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDB23B8], "assetReaderWithAsset:error:", v7, a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (!v18)
      {
        LODWORD(PixelFormatType) = 0;
LABEL_22:

        goto LABEL_23;
      }
      if (objc_msgSend(v18, "canAddOutput:", v17))
      {
        objc_msgSend(v19, "addOutput:", v17);
        if ((objc_msgSend(v19, "startReading") & 1) != 0)
        {
          v20 = (opaqueCMSampleBuffer *)objc_msgSend(v17, "copyNextSampleBuffer");
          v21 = v20;
          if (v20)
          {
            ImageBuffer = CMSampleBufferGetImageBuffer(v20);
            v23 = ImageBuffer;
            if (ImageBuffer)
            {
              PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
              CVPixelBufferRelease(v23);

              if ((v25 & 1) == 0
              {
                v35[0] = &unk_24CA5BA90;
                v35[1] = &unk_24CA5BAC0;
                v36[0] = &unk_24CA5BAA8;
                v36[1] = &unk_24CA5BAD8;
                v35[2] = &unk_24CA5BAF0;
                v35[3] = &unk_24CA5BB08;
                v36[2] = &unk_24CA5BAA8;
                v36[3] = &unk_24CA5BB20;
                v35[4] = &unk_24CA5BB38;
                v35[5] = &unk_24CA5BB68;
                v36[4] = &unk_24CA5BB50;
                v36[5] = &unk_24CA5BB20;
                v35[6] = &unk_24CA5BB80;
                v35[7] = &unk_24CA5BBB0;
                v36[6] = &unk_24CA5BB98;
                v36[7] = &unk_24CA5BBC8;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 8);
                +[MOVStreamIOUtility(Private) detectPixelFormatForAsset:videoTrackId:error:]::formatMappingTable = objc_claimAutoreleasedReturnValue();
              }
              v26 = (void *)+[MOVStreamIOUtility(Private) detectPixelFormatForAsset:videoTrackId:error:]::formatMappingTable;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", PixelFormatType);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "objectForKey:", v27);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
                LODWORD(PixelFormatType) = objc_msgSend(v19, "intValue");
              v17 = 0;
              goto LABEL_21;
            }
            CFRelease(v21);
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No pixel buffer in track (%d) in '%@'."), v6, v7);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v32, 26);

          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No sample buffer in track (%d) in '%@'."), v6, v7);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v31, 26);

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot read from track (%d) in '%@'."), v6, v7);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v30, 26);

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot add output to track (%d) in '%@'."), v6, v7);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v29, 26);

      }
      LODWORD(PixelFormatType) = 0;
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No format description for track (%d) in '%@'."), v6, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v28, 26);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot find track (%d) in '%@'."), v6, v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "populateReaderError:message:code:", a5, v28, 26);
  }

  LODWORD(PixelFormatType) = 0;
LABEL_23:

  return PixelFormatType;
}

+ (id)AVEProfileLevel10BitMonochrome
{
  void *v2;
  const __CFString *v3;

  +[MOVStreamEncoderConfig supportedProfileLevelsForHEVC](MOVStreamEncoderConfig, "supportedProfileLevelsForHEVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "containsObject:", CFSTR("HEVC_Monochrome12_AutoLevel"))
    && (objc_msgSend(v2, "containsObject:", CFSTR("HEVC_Monochrome10_AutoLevel")) & 1) == 0)
  {
    v3 = CFSTR("HEVC_Monochrome12_AutoLevel");
  }
  else
  {
    v3 = CFSTR("HEVC_Monochrome10_AutoLevel");
  }

  return (id)v3;
}

+ (double)clampedQuality:(double)result
{
  if (result > 1.0)
    result = 1.0;
  if (result < 0.0)
    return 0.0;
  return result;
}

+ (id)reservedMIOTrackMetadataKeys
{
  if (+[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::onceToken != -1)
    dispatch_once(&+[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::onceToken, &__block_literal_global_6);
  return (id)+[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::reservedList;
}

void __59__MOVStreamIOUtility_Private__reservedMIOTrackMetadataKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[32];

  v5[31] = *MEMORY[0x24BDAC8D0];
  v5[0] = CFSTR("mdta/com.apple.track_kind");
  v5[1] = CFSTR("mdta/com.apple.trackStreamType");
  v5[2] = CFSTR("mdta/com.apple.metadataTrackType");
  v5[3] = CFSTR("mdta/com.apple.framework.state.MOVStreamIO");
  v5[4] = CFSTR("mdta/com.apple.MOVStreamIO.stateMetadataIdentifier");
  v5[5] = CFSTR("version");
  v5[6] = CFSTR("mdta/com.apple.MOVStreamIO.versionKey");
  v5[7] = CFSTR("default_options");
  v5[8] = CFSTR("mdta/com.apple.MOVStreamIO.defaultOptions");
  v5[9] = CFSTR("mdta/com.apple.stream_sample_format");
  v5[10] = CFSTR("mdta/com.apple.trackStreamPixelFormat");
  v5[11] = CFSTR("mdta/com.apple.stream_encoded_sample_format");
  v5[12] = CFSTR("mdta/com.apple.trackStreamEncodedPixelFormat");
  v5[13] = CFSTR("mdta/com.apple.stream_sample_attachments_serialization_mode");
  v5[14] = CFSTR("mdta/com.apple.trackStreamAttachmentsSerializationMode");
  v5[15] = CFSTR("mdta/com.apple.stream_type_info");
  v5[16] = CFSTR("mdta/com.apple.trackTypeInfo");
  v5[17] = CFSTR("mdta/com.apple.stream_related_to_stream");
  v5[18] = CFSTR("mdta/com.apple.trackStreamRelatedToStream");
  v5[19] = CFSTR("mdta/com.apple.stream_relation_specifier");
  v5[20] = CFSTR("mdta/com.apple.trackStreamRelationSpecifier");
  v5[21] = CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row");
  v5[22] = CFSTR("mdta/com.apple.exactBytesPerRow");
  v5[23] = CFSTR("mdta/com.apple.stream_raw_bayer_rearrange_type");
  v5[24] = CFSTR("mdta/com.apple.RawBayerRearrangeType");
  v5[25] = CFSTR("mdta/com.apple.stream_sample_attachments");
  v5[26] = CFSTR("mdta/com.apple.rawSampleBufferAttachmentDict");
  v5[27] = CFSTR("mdta/com.apple.metadata_stream_item");
  v5[28] = CFSTR("mdta/com.apple.metadataDict");
  v0 = (void *)*MEMORY[0x24BDB1E50];
  objc_msgSend((id)*MEMORY[0x24BDB1E50], "stringByAppendingPathComponent:", *MEMORY[0x24BDB1EF0], CFSTR("mdta/com.apple.track_kind"), CFSTR("mdta/com.apple.trackStreamType"), CFSTR("mdta/com.apple.metadataTrackType"), CFSTR("mdta/com.apple.framework.state.MOVStreamIO"), CFSTR("mdta/com.apple.MOVStreamIO.stateMetadataIdentifier"), CFSTR("version"), CFSTR("mdta/com.apple.MOVStreamIO.versionKey"), CFSTR("default_options"), CFSTR("mdta/com.apple.MOVStreamIO.defaultOptions"), CFSTR("mdta/com.apple.stream_sample_format"), CFSTR("mdta/com.apple.trackStreamPixelFormat"), CFSTR("mdta/com.apple.stream_encoded_sample_format"), CFSTR("mdta/com.apple.trackStreamEncodedPixelFormat"), CFSTR("mdta/com.apple.stream_sample_attachments_serialization_mode"), CFSTR("mdta/com.apple.trackStreamAttachmentsSerializationMode"), CFSTR("mdta/com.apple.stream_type_info"),
    CFSTR("mdta/com.apple.trackTypeInfo"),
    CFSTR("mdta/com.apple.stream_related_to_stream"),
    CFSTR("mdta/com.apple.trackStreamRelatedToStream"),
    CFSTR("mdta/com.apple.stream_relation_specifier"),
    CFSTR("mdta/com.apple.trackStreamRelationSpecifier"),
    CFSTR("mdta/com.apple.stream_sample_exact_bytes_per_row"),
    CFSTR("mdta/com.apple.exactBytesPerRow"),
    CFSTR("mdta/com.apple.stream_raw_bayer_rearrange_type"),
    CFSTR("mdta/com.apple.RawBayerRearrangeType"),
    CFSTR("mdta/com.apple.stream_sample_attachments"),
    CFSTR("mdta/com.apple.rawSampleBufferAttachmentDict"),
    CFSTR("mdta/com.apple.metadata_stream_item"),
    CFSTR("mdta/com.apple.metadataDict"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[29] = v1;
  objc_msgSend(v0, "stringByAppendingPathComponent:", *MEMORY[0x24BDB1EF8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[30] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 31);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)+[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::reservedList;
  +[MOVStreamIOUtility(Private) reservedMIOTrackMetadataKeys]::reservedList = v3;

}

+ (id)nonMIOTrackMetadataItemsInMetadataItems:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v13;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[MOVStreamIOUtility reservedMIOTrackMetadataKeys](MOVStreamIOUtility, "reservedMIOTrackMetadataKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", v9);

        if ((v11 & 1) == 0)
          objc_msgSend(v3, "addObject:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  return v3;
}

+ (CVSMPTETime)timecodeForFrameNumber32:(SEL)a3 formatDescription:(int)a4
{
  CVSMPTETime *result;
  int v9;
  __int16 FrameQuanta;
  int v11;
  char TimeCodeFlags;
  int v13;
  int v14;
  int v15;
  int v16;
  BOOL v17;
  int v18;
  int v19;
  int v20;
  int v21;
  char v22;
  SInt16 v23;
  UInt32 v24;

  *(_QWORD *)&retstr->subframes = 0;
  *(_QWORD *)&retstr->type = 0;
  *(_QWORD *)&retstr->hours = 0;
  result = (CVSMPTETime *)CMFormatDescriptionGetMediaSubType(a5);
  if ((_DWORD)result != 1953325924)
    return result;
  v9 = bswap32(a4);
  FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a5);
  if (v9 >= 0)
    v11 = v9;
  else
    v11 = -v9;
  TimeCodeFlags = CMTimeCodeFormatDescriptionGetTimeCodeFlags(a5);
  v13 = FrameQuanta;
  if ((TimeCodeFlags & 1) != 0)
  {
    v14 = 600 * FrameQuanta - 18;
    v15 = 18 * (v11 / v14);
    v16 = v11 % v14;
    v17 = __OFSUB__(v16, 60 * FrameQuanta);
    v18 = v16 - 60 * FrameQuanta;
    if (v18 < 0 == v17)
      v15 += 2 * (v18 / (60 * FrameQuanta - 2)) + 2;
    v11 += v15;
  }
  retstr->frames = v11 % FrameQuanta;
  retstr->seconds = v11 / FrameQuanta % 60;
  v19 = v11 / FrameQuanta / 60 % 60;
  retstr->minutes = v19;
  v20 = v11 / v13 / 3600;
  if ((CMTimeCodeFormatDescriptionGetTimeCodeFlags(a5) & 2) != 0)
  {
    v21 = v20 % 24;
    if (v9 < 0)
    {
      v22 = CMTimeCodeFormatDescriptionGetTimeCodeFlags(a5);
      v23 = 23 - v21;
      if ((v22 & 4) != 0)
        v23 = v21;
      retstr->hours = v23;
      if ((v22 & 4) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
    retstr->hours = v21;
  }
  else
  {
    retstr->hours = v20;
    if (v9 < 0)
LABEL_17:
      retstr->minutes = v19 | 0x80;
  }
LABEL_18:
  retstr->flags = 1;
  result = (CVSMPTETime *)CMTimeCodeFormatDescriptionGetFrameQuanta(a5);
  if ((int)result > 29)
  {
    if ((_DWORD)result == 30)
    {
      v24 = 3;
    }
    else
    {
      if ((_DWORD)result != 60)
        return result;
      v24 = 6;
    }
  }
  else if ((_DWORD)result == 24)
  {
    v24 = 0;
  }
  else
  {
    if ((_DWORD)result != 25)
      return result;
    v24 = 1;
  }
  retstr->type = v24;
  return result;
}

+ (int64_t)frameNumber64ForTimecode:(CVSMPTETime *)a3 usingFormatDescription:(opaqueCMFormatDescription *)a4
{
  signed int FrameQuanta;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unint64_t v14;
  uint64_t v16;
  unsigned int v17;

  if (CMFormatDescriptionGetMediaSubType(a4) == 1952658996)
  {
    FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a4);
    v7 = 60 * FrameQuanta;
    v8 = a3->frames
       + a3->seconds * (uint64_t)FrameQuanta
       + (int)(60 * FrameQuanta * (a3->minutes & 0xFFFFFF7F))
       + 3600 * FrameQuanta * a3->hours;
    if ((CMTimeCodeFormatDescriptionGetTimeCodeFlags(a4) & 1) != 0)
    {
      v9 = 600 * FrameQuanta;
      v10 = -18 * (v8 / v9);
      v11 = v8 % v9;
      v12 = (int)v11 / v7;
      if (v11 >= 2 && v12 >= 1)
      {
        v16 = v10 - 2 * v12 + 2;
        v17 = (int)v11 % v7;
        if (v17 < 2)
          v10 = v16 + (int)~v17;
        else
          v10 = v16 - 2;
      }
      v8 += v10;
    }
    if ((a3->minutes & 0x80) != 0)
      v14 = -v8;
    else
      v14 = v8;
  }
  else
  {
    v14 = 0;
  }
  return bswap64(v14);
}

+ (int)frameNumber32ForTimecode:(CVSMPTETime *)a3 usingFormatDescription:(opaqueCMFormatDescription *)a4
{
  uint32_t FrameQuanta;
  signed int v7;
  int v8;
  int v9;
  int v10;
  unsigned int v12;
  int v14;
  unsigned int v15;

  if (CMFormatDescriptionGetMediaSubType(a4) == 1953325924)
  {
    FrameQuanta = CMTimeCodeFormatDescriptionGetFrameQuanta(a4);
    v7 = a3->frames + (a3->seconds + 60 * (a3->minutes & 0xFFFFFF7F) + 3600 * a3->hours) * FrameQuanta;
    if ((CMTimeCodeFormatDescriptionGetTimeCodeFlags(a4) & 1) != 0)
    {
      v8 = -18 * (v7 / (int)(600 * FrameQuanta));
      v9 = v7 % (int)(600 * FrameQuanta);
      v10 = v9 / (int)(60 * FrameQuanta);
      if (v9 >= 2 && v10 >= 1)
      {
        v14 = v8 - 2 * v10 + 2;
        v15 = v9 % (int)(60 * FrameQuanta);
        if (v15 < 2)
          v8 = v14 + ~v15;
        else
          v8 = v14 - 2;
      }
      v7 += v8;
    }
    if ((a3->minutes & 0x80) != 0)
      v12 = -v7;
    else
      v12 = v7;
  }
  else
  {
    v12 = 0;
  }
  return bswap32(v12);
}

+ (CVSMPTETime)advanceTimeCode:(SEL)a3 frameQuanta:(CVSMPTETime *)a4 dropFrame:(int64_t)a5
{
  SInt16 hours;
  SInt16 minutes;
  int seconds;
  SInt16 v9;
  int v10;
  __int16 v11;

  *(_DWORD *)&retstr->subframes = *(_DWORD *)&a4->subframes;
  *(_QWORD *)&retstr->counter = *(_QWORD *)&a4->counter;
  retstr->flags = a4->flags;
  hours = a4->hours;
  retstr->hours = hours;
  minutes = a4->minutes;
  retstr->minutes = minutes;
  seconds = (unsigned __int16)a4->seconds;
  retstr->seconds = seconds;
  v9 = a4->frames + 1;
  retstr->frames = v9;
  if (!(v9 % a5))
  {
    v10 = seconds + 1;
    *(_DWORD *)&retstr->seconds = (unsigned __int16)v10;
    if (v10 == 60)
    {
      v11 = minutes + 1;
      *(_DWORD *)&retstr->minutes = (unsigned __int16)v11;
      if (a6 && v11 % 10)
        retstr->frames = 2;
      if (v11 == 60)
        *(_DWORD *)&retstr->hours = (unsigned __int16)(hours + 1);
    }
  }
  return result;
}

+ (opaqueCMFormatDescription)createTimeCodeFormatDescriptionWithFrameRate:(double)a3 error:(id *)a4
{
  uint32_t v6;
  const __CFAllocator *v7;
  uint64_t v8;
  void *v9;
  CMTime frameDuration;
  CMTimeCodeFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  v6 = vcvtpd_u64_f64(a3);
  v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CMTimeMake(&frameDuration, 100, (int)(a3 * 100.0));
  v8 = CMTimeCodeFormatDescriptionCreate(v7, 0x74633634u, &frameDuration, v6, 3u, 0, &formatDescriptionOut);
  if (!(_DWORD)v8)
    return formatDescriptionOut;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create TimeCode32 FormatDescription with fps %f. Error: %d"), *(_QWORD *)&a3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v9, 8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (opaqueCMFormatDescription)createTimeCode32FormatDescriptionWithFrameRate:(double)a3 tcDropFrame:(BOOL)a4 error:(id *)a5
{
  uint32_t v7;
  const __CFAllocator *v8;
  uint64_t v9;
  void *v10;
  CMTime frameDuration;
  CMTimeCodeFormatDescriptionRef formatDescriptionOut;

  formatDescriptionOut = 0;
  if (a4)
    v7 = 3;
  else
    v7 = 2;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  CMTimeMake(&frameDuration, 100, (int)(a3 * 100.0));
  v9 = CMTimeCodeFormatDescriptionCreate(v8, 0x746D6364u, &frameDuration, vcvtpd_u64_f64(a3), v7, 0, &formatDescriptionOut);
  if (!(_DWORD)v9)
    return formatDescriptionOut;
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot create TimeCode32 FormatDescription with fps %f. Error: %d"), *(_QWORD *)&a3, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "internalErrorWithMessage:code:", v10, 8);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (BOOL)isMOVStreamIOMovMetadataIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[MIOVersion allVersionedKeysForKey:modifier:](MIOVersion, "allVersionedKeysForKey:modifier:", CFSTR("mdta/com.apple.framework.state.MOVStreamIO"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {

          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("mdta/com.apple.framework.mio.session.starttime")) & 1) != 0)
LABEL_12:
    v8 = 1;
  else
    v8 = objc_msgSend(v3, "isEqualToString:", CFSTR("mdta/com.apple.framework.mio.timeRangeMetadataKeyHint"));

  return v8;
}

+ (BOOL)saveSessionStartTime:(id *)a3 toMovieAtURL:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  MIOMovieMetadataUtility *v9;
  MIOMovieMetadataUtility *v10;
  BOOL v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  v7 = a4;
  v13 = *a3;
  objc_msgSend(MEMORY[0x24BDB2588], "movMetadataItemWithSessionStartTime:error:", &v13, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[MIOMovieMetadataUtility initWithURL:error:]([MIOMovieMetadataUtility alloc], "initWithURL:error:", v7, a5);
    v10 = v9;
    v11 = v9
       && -[MIOMovieMetadataUtility addMovieMetadataItem:](v9, "addMovieMetadataItem:", v8)
       && -[MIOMovieMetadataUtility applyChangesError:](v10, "applyChangesError:", a5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)getCustomAssociatedMetadataStreamIdFromTrack:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "formatDescriptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[__CFDictionary objectForKeyedSubscript:](CMFormatDescriptionGetExtensions((CMFormatDescriptionRef)v4), "objectForKeyedSubscript:", CFSTR("MetadataKeyTable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("2"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("1"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MetadataKeyValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v7, 4);

  return v8;
}

+ (void)colorRecordingConfigBitDepth:lossless:chromaSampling:error:.cold.1()
{
  __assert_rtn("+[MOVStreamIOUtility colorRecordingConfigBitDepth:lossless:chromaSampling:error:]", "MOVStreamIOUtility.mm", 1405, "0");
}

@end
