@implementation HSResponseDataParser

+ (id)parseErrorInResponseData:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  _DWORD v14[2];
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = v5 - 8;
  if (v5 < 8)
    goto LABEL_8;
  v7 = v5;
  v8 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v4), "bytes");
  v9 = bswap32(*v8);
  v10 = bswap32(v8[1]);
  if (v6 != v10)
  {
    v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109632;
      v14[1] = v9;
      v15 = 2048;
      v16 = v7;
      v17 = 2048;
      v18 = v10;
      _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_ERROR, "Warning: Invalid response data (code: %08x, length: %lu, encodedLength: %lu)", (uint8_t *)v14, 0x1Cu);
    }

    goto LABEL_8;
  }
  if (v9 != 1835364978)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  objc_msgSend(a1, "_parseErrorResponseWithBytes:length:", v8 + 2, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v11;
}

+ (id)parseResponseData:(id)a3
{
  return (id)objc_msgSend(a1, "enumerateRawItemsInResponseData:usingHandler:", a3, 0);
}

+ (id)enumerateRawItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  _DWORD v17[2];
  __int16 v18;
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "length");
  v9 = v8 - 8;
  if (v8 < 8)
  {
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v10 = v8;
  v11 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
  v12 = bswap32(*v11);
  v13 = bswap32(v11[1]);
  if (v9 != v13)
  {
    v15 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17[0] = 67109632;
      v17[1] = v12;
      v18 = 2048;
      v19 = v10;
      v20 = 2048;
      v21 = v13;
      _os_log_impl(&dword_20AA9E000, v15, OS_LOG_TYPE_ERROR, "Warning: Invalid response data (code: %08x, length: %lu, encodedLength: %lu)", (uint8_t *)v17, 0x1Cu);
    }

    goto LABEL_7;
  }
  objc_msgSend(a1, "_parseResponseCode:bytes:length:usingHandler:", v12, v11 + 2, v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v14;
}

+ (unint64_t)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 valuesOut:(id *)a5 valuesCapacity:(unint64_t)a6
{
  unint64_t result;
  unint64_t *p_var2;
  const char *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  unint64_t v12;
  int v13;
  unsigned __int16 v14;
  unsigned __int16 v15;
  unsigned __int16 v16;
  int v17;
  unsigned __int16 v18;
  int v19;

  result = 0;
  if (a4 && a6)
  {
    result = 0;
    p_var2 = &a5->var2;
    while (1)
    {
      v9 = *(_DWORD *)a3;
      v10 = *((_DWORD *)a3 + 1);
      v8 = a3 + 8;
      v11 = bswap32(v9);
      v12 = bswap32(v10);
      *((_DWORD *)p_var2 - 4) = v11;
      *(p_var2 - 1) = (unint64_t)v8;
      *p_var2 = v12;
      v13 = 2;
      if (v11 <= 1634358883)
        break;
      if (v11 > 1634953069)
      {
        if (v11 <= 1634956128)
        {
          if (v11 > 1634954338)
          {
            if (v11 == 1634954339)
              goto LABEL_70;
            v18 = 28789;
          }
          else
          {
            if (v11 == 1634953070)
              goto LABEL_70;
            v18 = 27513;
          }
LABEL_68:
          v19 = v18 | 0x61730000;
          goto LABEL_69;
        }
        if (v11 > 1634956651)
        {
          if (v11 == 1634956652 || v11 == 1835366516)
            goto LABEL_70;
          v19 = 1835626093;
          goto LABEL_69;
        }
        if ((v11 - 1634956129) <= 0x14 && ((1 << (v11 - 97)) & 0x142805) != 0)
          goto LABEL_70;
      }
      else
      {
        if (v11 <= 1634952044)
        {
          if ((v11 - 1634951521) <= 0x11 && ((1 << (v11 - 97)) & 0x20801) != 0 || v11 == 1634358884)
            goto LABEL_70;
          v17 = 1634366060;
LABEL_59:
          if (v11 == v17)
            goto LABEL_60;
          goto LABEL_73;
        }
        if (v11 > 1634952307)
        {
          if (v11 > 1634952560)
          {
            if (v11 == 1634952561)
              goto LABEL_70;
            v18 = 26221;
          }
          else
          {
            if (v11 == 1634952308)
              goto LABEL_70;
            v18 = 25956;
          }
          goto LABEL_68;
        }
        if ((v11 - 1634952045) <= 7 && ((1 << (v11 - 109)) & 0x8B) != 0)
          goto LABEL_70;
      }
LABEL_73:
      v13 = 1;
LABEL_70:
      *((_DWORD *)p_var2 + 2) = v13;
      ++result;
      a4 = a4 - 8 - v12;
      if (a4)
      {
        a3 = &v8[v12];
        p_var2 += 4;
        if (result < a6)
          continue;
      }
      return result;
    }
    if (v11 > 1634030159)
    {
      if (v11 > 1634036069)
      {
        if (v11 <= 1634354516)
        {
          if (v11 == 1634036070)
            goto LABEL_60;
          if (v11 == 1634037878)
            goto LABEL_70;
          v19 = 1634169456;
        }
        else
        {
          if (v11 > 1634356832)
          {
            if (v11 == 1634356833)
              goto LABEL_70;
            v15 = 20565;
          }
          else
          {
            if (v11 == 1634354517)
              goto LABEL_70;
            v15 = 17779;
          }
          v19 = v15 | 0x616A0000;
        }
        goto LABEL_69;
      }
      if (v11 <= 1634031683)
      {
        if (v11 == 1634030160 || v11 == 1634030192)
          goto LABEL_70;
        v16 = 21326;
        goto LABEL_54;
      }
      if (v11 == 1634031684 || v11 == 1634034544)
        goto LABEL_70;
      v14 = 26220;
    }
    else
    {
      if (v11 > 1634026829)
      {
        if (v11 > 1634029133)
        {
          if (v11 == 1634029134)
            goto LABEL_70;
          if (v11 == 1634029636)
          {
LABEL_60:
            v13 = 3;
            goto LABEL_70;
          }
          v16 = 20580;
        }
        else
        {
          if (v11 == 1634026830)
            goto LABEL_70;
          if (v11 == 1634027347)
            goto LABEL_60;
          v16 = 19800;
        }
LABEL_54:
        v19 = v16 | 0x61650000;
LABEL_69:
        if (v11 == v19)
          goto LABEL_70;
        goto LABEL_73;
      }
      if ((v11 - 1634026308) <= 0x31)
      {
        if (((1 << (v11 - 68)) & 0x3400000014000) != 0)
          goto LABEL_70;
        if (v11 == 1634026308)
          goto LABEL_60;
      }
      v14 = 17483;
    }
    v17 = v14 | 0x61650000;
    goto LABEL_59;
  }
  return result;
}

+ (void)parseItemWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  void (**v8)(id, _QWORD *, unint64_t, char *);
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a5)
  {
    v8 = (void (**)(id, _QWORD *, unint64_t, char *))a5;
    v9 = objc_msgSend(a1, "_parseItemPropertyCountWithBytes:length:", a3, a4);
    v10 = v9;
    if (v9 <= 1)
      v11 = 1;
    else
      v11 = v9;
    v12 = &v13 - 4 * v11;
    objc_msgSend(a1, "parseItemWithBytes:length:valuesOut:valuesCapacity:", a3, a4, v12, v9);
    HIBYTE(v13) = 0;
    v8[2](v8, v12, v10, (char *)&v13 + 7);

  }
}

+ (void)enumerateItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__HSResponseDataParser_enumerateItemsInResponseData_usingHandler___block_invoke;
    v9[3] = &unk_24C364490;
    v11 = a1;
    v10 = v6;
    v8 = (id)objc_msgSend(a1, "enumerateRawItemsInResponseData:usingHandler:", a3, v9);

  }
}

+ (void)enumerateDeletedItemsInResponseData:(id)a3 usingHandler:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  unsigned int *v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v17 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_msgSend(v17, "length");
    if (v7 >= 9)
    {
      v8 = v7;
      v9 = (unsigned int *)objc_msgSend(objc_retainAutorelease(v17), "bytes");
      v10 = bswap32(*v9);
      if (v10 == 1634757753 || v10 == 1633968755)
      {
        v12 = v8 - 8;
        if (v8 - 8 == bswap32(v9[1]))
        {
          if (v12 < 9)
          {
LABEL_13:
            v16 = 0;
          }
          else
          {
            v13 = v9 + 2;
            while (1)
            {
              v14 = bswap32(v13[1]);
              v15 = v13 + 2;
              if (bswap32(*v13) == 1836409964)
                break;
              v13 = (unsigned int *)((char *)v15 + v14);
              v12 = v12 - v14 - 8;
              if (v12 <= 8)
                goto LABEL_13;
            }
            objc_msgSend(a1, "_parseDeletedIDListingWithBytes:length:", v15, v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v18[0] = MEMORY[0x24BDAC760];
          v18[1] = 3221225472;
          v18[2] = __73__HSResponseDataParser_enumerateDeletedItemsInResponseData_usingHandler___block_invoke;
          v18[3] = &unk_24C3644B8;
          v19 = v6;
          objc_msgSend(v16, "enumerateObjectsUsingBlock:", v18);

        }
      }
    }
  }

}

+ (unint64_t)_parseItemPropertyCountWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = 0;
  if (a4)
  {
    do
    {
      v5 = bswap32(*((_DWORD *)a3 + 1));
      ++result;
      a3 += v5 + 8;
      v6 = a4 - v5;
      a4 = v6 - 8;
    }
    while (v6 != 8);
  }
  return result;
}

+ (id)_parseResponseCode:(unsigned int)a3 bytes:(const char *)a4 length:(unint64_t)a5 usingHandler:(id)a6
{
  id v10;
  uint64_t v11;
  int v12;
  void *v13;
  NSObject *v15;
  _DWORD v16[2];
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  if ((int)a3 <= 1634757752)
  {
    if ((int)a3 > 1634026304)
    {
      if ((int)a3 <= 1634027330)
      {
        if (a3 == 1634026305)
        {
          objc_msgSend(a1, "_parseCloudArtworkInfoResponseWithBytes:length:", a4, a5);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (a3 == 1634026348)
        {
          objc_msgSend(a1, "_parseCloudLyricsInfoResponseWithBytes:length:", a4, a5);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        goto LABEL_44;
      }
      if (a3 != 1634027331)
      {
        if (a3 == 1634030667)
        {
          objc_msgSend(a1, "_parseAuthorizedAccountTokenWithBytes:length:", a4, a5);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (a3 == 1634356338)
        {
          objc_msgSend(a1, "_parseBulkCloudLyricsInfoResponseWithBytes:length:", a4, a5);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        goto LABEL_44;
      }
      goto LABEL_33;
    }
    if ((int)a3 > 1634025792)
    {
      if (a3 != 1634025793 && a3 != 1634025813)
      {
        if (a3 == 1634026066)
        {
          objc_msgSend(a1, "_parseBulkCloudArtworkInfoResponseWithBytes:length:", a4, a5);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        goto LABEL_44;
      }
      goto LABEL_33;
    }
    if (a3 == 1633841775)
      goto LABEL_33;
    v12 = 1633968755;
    goto LABEL_32;
  }
  if ((int)a3 <= 1668117363)
  {
    if ((int)a3 > 1635148897)
    {
      if (a3 != 1635148898)
      {
        if (a3 == 1667326825)
        {
          objc_msgSend(a1, "_parseControlInterfacesResponseWithBytes:length:", a4, a5);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        if (a3 == 1668113264)
        {
          objc_msgSend(a1, "_parseControlPromptResponseWithBytes:length:", a4, a5);
          v11 = objc_claimAutoreleasedReturnValue();
          goto LABEL_34;
        }
        goto LABEL_44;
      }
      goto LABEL_33;
    }
    if (a3 == 1634757753)
      goto LABEL_33;
    v12 = 1634759535;
LABEL_32:
    if (a3 != v12)
      goto LABEL_44;
    goto LABEL_33;
  }
  if ((int)a3 > 1835364977)
  {
    switch(a3)
    {
      case 0x6D657272u:
LABEL_47:
        v13 = 0;
        goto LABEL_35;
      case 0x6D757064u:
        objc_msgSend(a1, "_parseUpdateResponseWithBytes:length:", a4, a5);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
      case 0x6D6C6F67u:
        objc_msgSend(a1, "_parseLoginResponseWithBytes:length:", a4, a5);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_34;
    }
LABEL_44:
    v15 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16[0] = 67109888;
      v16[1] = HIBYTE(a3);
      v17 = 1024;
      v18 = HIWORD(a3);
      v19 = 1024;
      v20 = a3 >> 8;
      v21 = 1024;
      v22 = a3;
      _os_log_impl(&dword_20AA9E000, v15, OS_LOG_TYPE_DEBUG, "Unhandled code in response: %c%c%c%c", (uint8_t *)v16, 0x1Au);
    }

    goto LABEL_47;
  }
  if (a3 == 1668117364)
  {
    objc_msgSend(a1, "_parsePlayStatusResponseWithBytes:length:", a4, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (a3 == 1835360880)
  {
LABEL_33:
    objc_msgSend(a1, "_parseItemsResponseWithBytes:length:usingHandler:", a4, a5, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  if (a3 != 1835361379)
    goto LABEL_44;
  objc_msgSend(a1, "_parseEditCommandResponseWithBytes:length:", a4, a5);
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_34:
  v13 = (void *)v11;
LABEL_35:

  return v13;
}

+ (id)_parseLoginResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  _BYTE v21[10];
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    goto LABEL_14;
  v4 = a4;
  v6 = 0;
  do
  {
    v7 = *(unsigned __int8 *)a3;
    v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    v9 = *((unsigned __int8 *)a3 + 3);
    v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1836282996)
      goto LABEL_11;
    if (v10 == 1835821412)
    {
      v6 = bswap32(*((_DWORD *)a3 + 2));
      v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v21 = v6;
        v13 = v12;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = "Login session ID: %lu";
        v16 = 12;
LABEL_9:
        _os_log_impl(&dword_20AA9E000, v13, v14, v15, buf, v16);
      }
    }
    else
    {
      v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)v21 = v7;
        *(_WORD *)&v21[4] = 1024;
        *(_DWORD *)&v21[6] = HIWORD(v8);
        v22 = 1024;
        v23 = v10 >> 8;
        v24 = 1024;
        v25 = v9;
        v13 = v12;
        v14 = OS_LOG_TYPE_DEBUG;
        v15 = "Unhandled code in login response: %c%c%c%c";
        v16 = 26;
        goto LABEL_9;
      }
    }

LABEL_11:
    v17 = bswap32(v11);
    a3 += v17 + 8;
    v4 = v4 - 8 - v17;
  }
  while (v4);
  if (!v6)
  {
LABEL_14:
    v18 = 0;
    return v18;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  return v18;
}

+ (id)_parseUpdateResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4;
  uint64_t v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  uint32_t v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!a4)
    goto LABEL_14;
  v4 = a4;
  v6 = 0;
  do
  {
    v7 = *(unsigned __int8 *)a3;
    v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    v9 = *((unsigned __int8 *)a3 + 3);
    v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1836282996)
      goto LABEL_11;
    if (v10 == 1836413810)
    {
      v6 = bswap32(*((_DWORD *)a3 + 2));
      v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v21 = v6;
        v13 = v12;
        v14 = OS_LOG_TYPE_DEFAULT;
        v15 = "Server revision number: %d";
        v16 = 8;
LABEL_9:
        _os_log_impl(&dword_20AA9E000, v13, v14, v15, buf, v16);
      }
    }
    else
    {
      v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        v21 = v7;
        v22 = 1024;
        v23 = HIWORD(v8);
        v24 = 1024;
        v25 = v10 >> 8;
        v26 = 1024;
        v27 = v9;
        v13 = v12;
        v14 = OS_LOG_TYPE_DEBUG;
        v15 = "Unhandled code in update response: %c%c%c%c";
        v16 = 26;
        goto LABEL_9;
      }
    }

LABEL_11:
    v17 = bswap32(v11);
    a3 += v17 + 8;
    v4 = v4 - 8 - v17;
  }
  while (v4);
  if (!(_DWORD)v6)
  {
LABEL_14:
    v18 = 0;
    return v18;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  return v18;
}

+ (id)_parseAuthorizedAccountTokenWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const __CFString *v16;
  _DWORD v18[2];
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    while (1)
    {
      v7 = *(unsigned __int8 *)a3;
      v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v9 = *((unsigned __int8 *)a3 + 3);
      v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      v11 = bswap32(*((_DWORD *)a3 + 1));
      v12 = a3 + 8;
      if (v10 <= 1634030674)
        break;
      if (v10 == 1634030675)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", bswap32(*((_DWORD *)a3 + 2)));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v15 = v13;
        v16 = CFSTR("com.apple.itunes.drm-token-request-status");
LABEL_12:
        objc_msgSend(v14, "setObject:forKey:", v15, v16);
        goto LABEL_13;
      }
      if (v10 != 1836282996)
        goto LABEL_8;
LABEL_14:
      a3 = &v12[v11];
      a4 = a4 - 8 - v11;
      if (!a4)
        return v6;
    }
    if (v10 == 1634026578)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (((unint64_t)*((unsigned __int8 *)a3 + 8) << 56) | ((unint64_t)*((unsigned __int8 *)a3 + 9) << 48) | ((unint64_t)*((unsigned __int8 *)a3 + 10) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 11) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 12) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 13) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 14) << 8))+ *((unsigned __int8 *)a3 + 15));
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v6;
      v15 = v13;
      v16 = CFSTR("com.apple.itunes.drm-user-id");
      goto LABEL_12;
    }
    if (v10 == 1634030660)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", a3 + 8, v11, 0);
      v14 = v6;
      v15 = v13;
      v16 = CFSTR("com.apple.itunes.drm-token-data");
      goto LABEL_12;
    }
LABEL_8:
    v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18[0] = 67109888;
      v18[1] = v7;
      v19 = 1024;
      v20 = HIWORD(v8);
      v21 = 1024;
      v22 = v10 >> 8;
      v23 = 1024;
      v24 = v9;
      _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in authorized account token response: %c%c%c%c", (uint8_t *)v18, 0x1Au);
    }
LABEL_13:

    goto LABEL_14;
  }
  return v6;
}

+ (id)_parseBulkCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  NSObject *v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  const char *v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  if (a4)
  {
    do
    {
      v5 = *(unsigned __int8 *)a3;
      v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v7 = *((unsigned __int8 *)a3 + 3);
      v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      v9 = *((_DWORD *)a3 + 1);
      v10 = a3 + 8;
      v11 = a4 - 8;
      if (v8 != 1836282996)
      {
        if (v8 == 1835819884)
        {
          objc_msgSend(a1, "_parseListingCollectionWithBytes:length:usingHandler:", a3 + 8, a4 - 8, 0);
          v12 = v4;
          v4 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            v17 = v5;
            v18 = 1024;
            v19 = HIWORD(v6);
            v20 = 1024;
            v21 = v8 >> 8;
            v22 = 1024;
            v23 = v7;
            _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_DEBUG, "Unhandled code in bulk cloud artwork info response: %c%c%c%c", buf, 0x1Au);
          }
        }

      }
      v13 = bswap32(v9);
      a3 = &v10[v13];
      a4 = v11 - v13;
    }
    while (v11 != v13);
  }
  return v4;
}

+ (id)_parseBulkCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  NSObject *v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unsigned int v9;
  const char *v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  if (a4)
  {
    do
    {
      v5 = *(unsigned __int8 *)a3;
      v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v7 = *((unsigned __int8 *)a3 + 3);
      v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      v9 = *((_DWORD *)a3 + 1);
      v10 = a3 + 8;
      v11 = a4 - 8;
      if (v8 != 1836282996)
      {
        if (v8 == 1835819884)
        {
          objc_msgSend(a1, "_parseListingCollectionWithBytes:length:usingHandler:", a3 + 8, a4 - 8, 0);
          v12 = v4;
          v4 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            v17 = v5;
            v18 = 1024;
            v19 = HIWORD(v6);
            v20 = 1024;
            v21 = v8 >> 8;
            v22 = 1024;
            v23 = v7;
            _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_DEBUG, "Unhandled code in bulk cloud lyrics info response: %c%c%c%c", buf, 0x1Au);
          }
        }

      }
      v13 = bswap32(v9);
      a3 = &v10[v13];
      a4 = v11 - v13;
    }
    while (v11 != v13);
  }
  return v4;
}

+ (id)_parseCloudArtworkInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  id i;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  for (i = (id)objc_claimAutoreleasedReturnValue(); a4; a4 = a4 - 8 - v11)
  {
    v7 = *(unsigned __int8 *)a3;
    v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    v9 = *((unsigned __int8 *)a3 + 3);
    v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    v11 = bswap32(*((_DWORD *)a3 + 1));
    v12 = a3 + 8;
    if (v10 != 1836282996)
    {
      if (v10 == 1835295596)
      {
        objc_msgSend(a1, "_parseDictionaryCollectionWithBytes:length:", v12, v11);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(i, "addEntriesFromDictionary:", v13);
      }
      else
      {
        v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          v17 = v7;
          v18 = 1024;
          v19 = HIWORD(v8);
          v20 = 1024;
          v21 = v10 >> 8;
          v22 = 1024;
          v23 = v9;
          _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in cloud artwork info response: %c%c%c%c", buf, 0x1Au);
        }
      }

    }
    a3 = &v12[v11];
  }
  return i;
}

+ (id)_parseCloudLyricsInfoResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  id i;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  for (i = (id)objc_claimAutoreleasedReturnValue(); a4; a4 = a4 - 8 - v11)
  {
    v7 = *(unsigned __int8 *)a3;
    v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    v9 = *((unsigned __int8 *)a3 + 3);
    v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    v11 = bswap32(*((_DWORD *)a3 + 1));
    v12 = a3 + 8;
    if (v10 != 1836282996)
    {
      if (v10 == 1835295596)
      {
        objc_msgSend(a1, "_parseDictionaryCollectionWithBytes:length:", v12, v11);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(i, "addEntriesFromDictionary:", v13);
      }
      else
      {
        v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109888;
          v17 = v7;
          v18 = 1024;
          v19 = HIWORD(v8);
          v20 = 1024;
          v21 = v10 >> 8;
          v22 = 1024;
          v23 = v9;
          _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in cloud artwork info response: %c%c%c%c", buf, 0x1Au);
        }
      }

    }
    a3 = &v12[v11];
  }
  return i;
}

+ (id)_parseControlInterfacesResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  NSObject *v4;
  int v5;
  unsigned int v6;
  int v7;
  int v8;
  unsigned int v9;
  const char *v10;
  unint64_t v11;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  if (a4)
  {
    while (1)
    {
      v5 = *(unsigned __int8 *)a3;
      v6 = (v5 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v7 = *((unsigned __int8 *)a3 + 3);
      v8 = v7 | (*((unsigned __int8 *)a3 + 2) << 8) | v6;
      v9 = *((_DWORD *)a3 + 1);
      v10 = a3 + 8;
      v11 = a4 - 8;
      if (v8 > 1836282995)
        break;
      if (v8 == 1835819884)
      {
        objc_msgSend(a1, "_parseListingCollectionWithBytes:length:usingHandler:", a3 + 8, a4 - 8, 0);
        v13 = v4;
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
      if (v8 != 1836213103)
        goto LABEL_10;
LABEL_14:
      v14 = bswap32(v9);
      a3 = &v10[v14];
      a4 = v11 - v14;
      if (v11 == v14)
        return v4;
    }
    if (v8 == 1836282996 || v8 == 1836344175)
      goto LABEL_14;
LABEL_10:
    v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      v18 = v5;
      v19 = 1024;
      v20 = HIWORD(v6);
      v21 = 1024;
      v22 = v8 >> 8;
      v23 = 1024;
      v24 = v7;
      _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in control interfaces response: %c%c%c%c", buf, 0x1Au);
    }
LABEL_13:

    goto LABEL_14;
  }
  return v4;
}

+ (id)_parseControlPromptResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    while (1)
    {
      v7 = *(unsigned __int8 *)a3;
      v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v9 = *((unsigned __int8 *)a3 + 3);
      v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      v11 = bswap32(*((_DWORD *)a3 + 1));
      v12 = a3 + 8;
      if (v10 == 1835295596)
        break;
      if (v10 != 1836282996)
      {
        if (v10 == 1835624804)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
          v13 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v13, CFSTR("dmap.itemid"));
        }
        else
        {
          v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            v17 = v7;
            v18 = 1024;
            v19 = HIWORD(v8);
            v20 = 1024;
            v21 = v10 >> 8;
            v22 = 1024;
            v23 = v9;
            _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in control prompt response: %c%c%c%c", buf, 0x1Au);
          }
        }
LABEL_10:

      }
      a3 = &v12[v11];
      a4 = a4 - 8 - v11;
      if (!a4)
        return v6;
    }
    objc_msgSend(a1, "_parseDictionaryCollectionWithBytes:length:", a3 + 8, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v6, "addEntriesFromDictionary:", v13);
    goto LABEL_10;
  }
  return v6;
}

+ (id)_parseDeletedIDListingWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  _DWORD v16[2];
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= 9)
  {
    do
    {
      v7 = *(unsigned __int8 *)a3;
      v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v9 = *((unsigned __int8 *)a3 + 3);
      v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      v11 = *((_DWORD *)a3 + 1);
      if (v10 == 1835625572)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (((unint64_t)*((unsigned __int8 *)a3 + 8) << 56) | ((unint64_t)*((unsigned __int8 *)a3 + 9) << 48) | ((unint64_t)*((unsigned __int8 *)a3 + 10) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 11) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 12) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 13) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 14) << 8))+ *((unsigned __int8 *)a3 + 15));
        v12 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v10 != 1835624804)
        {
          v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            v16[0] = 67109888;
            v16[1] = v7;
            v17 = 1024;
            v18 = HIWORD(v8);
            v19 = 1024;
            v20 = v10 >> 8;
            v21 = 1024;
            v22 = v9;
            _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in deleted item ID listing response: %c%c%c%c", (uint8_t *)v16, 0x1Au);
          }
          goto LABEL_7;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
        v12 = objc_claimAutoreleasedReturnValue();
      }
      v13 = v12;
      objc_msgSend(v6, "addObject:", v12);
LABEL_7:
      v14 = bswap32(v11);

      a3 += v14 + 8;
      a4 = a4 - 8 - v14;
    }
    while (a4 > 8);
  }
  return v6;
}

+ (id)_parseDictionaryCollectionWithBytes:(const char *)a3 length:(unint64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  id v15;
  id v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 >= 9)
  {
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(unsigned __int8 *)a3;
      v9 = (v8 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v10 = *((unsigned __int8 *)a3 + 3);
      v11 = v10 | (*((unsigned __int8 *)a3 + 2) << 8) | v9;
      v12 = bswap32(*((_DWORD *)a3 + 1));
      v13 = a3 + 8;
      if (v11 > 1835297656)
      {
        if (v11 != 1835300460)
        {
          if (v11 != 1835297657)
          {
LABEL_16:
            v14 = os_log_create("com.apple.amp.HomeSharing", "Library");
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109888;
              v19 = v8;
              v20 = 1024;
              v21 = HIWORD(v9);
              v22 = 1024;
              v23 = v11 >> 8;
              v24 = 1024;
              v25 = v10;
              _os_log_impl(&dword_20AA9E000, v14, OS_LOG_TYPE_DEBUG, "Unhandled code in dictionary collection: %c%c%c%c", buf, 0x1Au);
            }
            goto LABEL_11;
          }
LABEL_9:
          v14 = v7;
          v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v13, v12, 4);
          goto LABEL_11;
        }
      }
      else
      {
        if (v11 == 1668113253)
          goto LABEL_9;
        if (v11 != 1668113270)
          goto LABEL_16;
      }
      v14 = v6;
      v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v13, v12, 4);
LABEL_11:

      if (v7 && v6)
      {
        objc_msgSend(v17, "setObject:forKey:", v6, v7);

        v7 = 0;
        v6 = 0;
      }
      a3 = &v13[v12];
      a4 = a4 - 8 - v12;
      if (a4 <= 8)
        goto LABEL_19;
    }
  }
  v7 = 0;
  v6 = 0;
LABEL_19:
  v15 = v17;

  return v15;
}

+ (id)_parseEditCommandResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *v6;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  const __CFString *v15;
  uint64_t v16;
  _DWORD v18[2];
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    while (1)
    {
      v7 = *(unsigned __int8 *)a3;
      v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v9 = *((unsigned __int8 *)a3 + 3);
      v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      v11 = *((_DWORD *)a3 + 1);
      if (v10 == 1835624804)
        break;
      if (v10 != 1836282996)
      {
        if (v10 == 1836413810)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = v6;
          v14 = v12;
          v15 = CFSTR("dmap.serverrevision");
          goto LABEL_7;
        }
        v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          v18[0] = 67109888;
          v18[1] = v7;
          v19 = 1024;
          v20 = HIWORD(v8);
          v21 = 1024;
          v22 = v10 >> 8;
          v23 = 1024;
          v24 = v9;
          _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_DEBUG, "Unhandled code in editing command response: %c%c%c%c", (uint8_t *)v18, 0x1Au);
        }
LABEL_10:

      }
      v16 = bswap32(v11);
      a3 += v16 + 8;
      a4 = a4 - 8 - v16;
      if (!a4)
        return v6;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v6;
    v14 = v12;
    v15 = CFSTR("dmap.itemid");
LABEL_7:
    objc_msgSend(v13, "setObject:forKey:", v14, v15);
    goto LABEL_10;
  }
  return v6;
}

+ (id)_parseUpdateTypeWithBytes:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v4;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v11;
  id v12;
  void *v13;

  if (a4)
  {
    v4 = a4;
    v6 = 0;
    while (1)
    {
      v7 = bswap32(*(_DWORD *)a3);
      v8 = bswap32(*((_DWORD *)a3 + 1));
      v9 = (unsigned __int8 *)(a3 + 8);
      if (v7 == 1836414073)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v9);
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }
      else if (v7 == 1633968755 || v7 == 1634759535)
      {
        objc_msgSend(a1, "_parseUpdateTypeWithBytes:length:", a3 + 8, v8);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      a3 = (const char *)&v9[v8];
      v4 = v4 - 8 - v8;
      if (!v4)
        goto LABEL_14;
    }
  }
  v6 = 0;
LABEL_14:
  v12 = v6;
  v6 = v12;
LABEL_15:
  v13 = v12;

  return v13;
}

+ (id)_parseItemsResponseWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  __int128 v7;
  NSObject *v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  unint64_t v14;
  BOOL v17;
  int v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v22;
  os_log_type_t v23;
  const char *v24;
  uint32_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  unsigned int v30;
  uint64_t v31;
  __int128 v33;
  id v34;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v34 = a5;
  v8 = 0;
  if (a4)
  {
    *(_QWORD *)&v7 = 67109120;
    v33 = v7;
    while (1)
    {
      v9 = *(unsigned __int8 *)a3;
      v10 = (v9 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v11 = *((unsigned __int8 *)a3 + 3);
      v12 = v11 | (*((unsigned __int8 *)a3 + 2) << 8) | v10;
      v13 = *((_DWORD *)a3 + 1);
      v14 = a4 - 8;
      if (v12 > 1836213102)
      {
        if (v12 > 1836409963)
        {
          v17 = v12 == 1836409964 || v12 == 1836413810;
          v18 = 1836414073;
        }
        else
        {
          if (v12 == 1836213103)
          {
            v26 = *((unsigned __int8 *)a3 + 8);
            v27 = *((unsigned __int8 *)a3 + 9);
            v28 = *((unsigned __int8 *)a3 + 10);
            v29 = *((unsigned __int8 *)a3 + 11);
            v20 = os_log_create("com.apple.amp.HomeSharing", "Library");
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v33;
              v37 = (v26 << 24) | (v27 << 16) | (v28 << 8) | v29;
              v22 = v20;
              v23 = OS_LOG_TYPE_DEFAULT;
              v24 = "Returned count: %d";
              goto LABEL_36;
            }
            goto LABEL_38;
          }
          v17 = v12 == 1836282996;
          v18 = 1836344175;
        }
        if (v17 || v12 == v18)
          goto LABEL_39;
        goto LABEL_30;
      }
      if (v12 <= 1633838957)
        break;
      if (v12 == 1633838958)
        goto LABEL_20;
      if (v12 != 1634025810)
      {
        if (v12 == 1835819884)
        {
          objc_msgSend(a1, "_parseListingCollectionWithBytes:length:usingHandler:", a3 + 8, a4 - 8, v34);
          v19 = objc_claimAutoreleasedReturnValue();
LABEL_21:
          v20 = v8;
          v8 = v19;
          goto LABEL_38;
        }
        goto LABEL_30;
      }
      v20 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v30 = bswap32(*((_DWORD *)a3 + 2));
        *(_DWORD *)buf = v33;
        v37 = v30;
        v22 = v20;
        v23 = OS_LOG_TYPE_DEFAULT;
        v24 = "Authorized DSIDs revision code: %d";
LABEL_36:
        v25 = 8;
LABEL_37:
        _os_log_impl(&dword_20AA9E000, v22, v23, v24, buf, v25);
      }
LABEL_38:

LABEL_39:
      v31 = bswap32(v13);
      a3 += v31 + 8;
      a4 = v14 - v31;
      if (v14 == v31)
        goto LABEL_40;
    }
    if (v12 == 1633837420 || v12 == 1633837426 || v12 == 1633837936)
    {
LABEL_20:
      objc_msgSend(a1, "_parseBrowseListingWithBytes:length:", a3 + 8, a4 - 8, v33);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
LABEL_30:
    v20 = os_log_create("com.apple.amp.HomeSharing", "Library");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109888;
      v37 = v9;
      v38 = 1024;
      v39 = HIWORD(v10);
      v40 = 1024;
      v41 = v12 >> 8;
      v42 = 1024;
      v43 = v11;
      v22 = v20;
      v23 = OS_LOG_TYPE_DEBUG;
      v24 = "Unhandled code in items response: %c%c%c%c";
      v25 = 26;
      goto LABEL_37;
    }
    goto LABEL_38;
  }
LABEL_40:

  return v8;
}

+ (id)_parseListingCollectionWithBytes:(const char *)a3 length:(unint64_t)a4 usingHandler:(id)a5
{
  id v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  const char *v14;
  NSObject *v17;
  id v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  unsigned int v24;
  __int16 v25;
  unsigned int v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  if (v8)
  {
    v20 = 0;
    if (!a4)
      goto LABEL_16;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_16;
  }
  do
  {
    v9 = *(unsigned __int8 *)a3;
    v10 = (v9 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    v11 = *((unsigned __int8 *)a3 + 3);
    v12 = v11 | (*((unsigned __int8 *)a3 + 2) << 8) | v10;
    v13 = bswap32(*((_DWORD *)a3 + 1));
    v14 = a3 + 8;
    if (v12 == 1634025828 || v12 == 1835821428 || v12 == 1634036070)
    {
      objc_msgSend(a1, "_parseListingItemWithBytes:length:usingHandler:", v14, v13, v8);
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v8)
        objc_msgSend(v20, "addObject:", v17);
    }
    else
    {
      v17 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        v22 = v9;
        v23 = 1024;
        v24 = HIWORD(v10);
        v25 = 1024;
        v26 = v12 >> 8;
        v27 = 1024;
        v28 = v11;
        _os_log_impl(&dword_20AA9E000, v17, OS_LOG_TYPE_DEBUG, "Unhandled code in listing collection response: %c%c%c%c", buf, 0x1Au);
      }
    }

    a3 = &v14[v13];
    a4 = a4 - 8 - v13;
  }
  while (a4);
LABEL_16:

  return v20;
}

+ (id)_parseBrowseListingWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *i;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  _DWORD v15[2];
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; a4 = a4 - 8 - v11)
  {
    v7 = *(unsigned __int8 *)a3;
    v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    v9 = *((unsigned __int8 *)a3 + 3);
    v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    v11 = bswap32(*((_DWORD *)a3 + 1));
    v12 = a3 + 8;
    if (v10 == 1835821428)
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v12, v11, 4);
      objc_msgSend(i, "addObject:", v13);
    }
    else
    {
      v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v15[0] = 67109888;
        v15[1] = v7;
        v16 = 1024;
        v17 = HIWORD(v8);
        v18 = 1024;
        v19 = v10 >> 8;
        v20 = 1024;
        v21 = v9;
        _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in browse listing response: %c%c%c%c", (uint8_t *)v15, 0x1Au);
      }
    }

    a3 = &v12[v11];
  }
  return i;
}

+ (id)_parseItemIDArrayWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *i;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  _DWORD v15[2];
  __int16 v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; a4 = a4 - 8 - v13)
  {
    v7 = *(unsigned __int8 *)a3;
    v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    v9 = *((unsigned __int8 *)a3 + 3);
    v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    v11 = *((_DWORD *)a3 + 1);
    if (v10 == 1835624804)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(i, "addObject:", v12);
    }
    else
    {
      v12 = os_log_create("com.apple.amp.HomeSharing", "Library");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v15[0] = 67109888;
        v15[1] = v7;
        v16 = 1024;
        v17 = HIWORD(v8);
        v18 = 1024;
        v19 = v10 >> 8;
        v20 = 1024;
        v21 = v9;
        _os_log_impl(&dword_20AA9E000, v12, OS_LOG_TYPE_DEBUG, "Unhandled code in item ID array response: %c%c%c%c", (uint8_t *)v15, 0x1Au);
      }
    }
    v13 = bswap32(v11);

    a3 += v13 + 8;
  }
  return i;
}

+ (id)_parsePlayStatusResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned __int8 *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _DWORD v18[2];
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    while (1)
    {
      v7 = *(unsigned __int8 *)a3;
      v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
      v9 = *((unsigned __int8 *)a3 + 3);
      v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
      v11 = bswap32(*((_DWORD *)a3 + 1));
      v12 = (unsigned __int8 *)(a3 + 8);
      if (v10 <= 1667330931)
        break;
      if (v10 <= 1667584372)
      {
        if (v10 > 1667331698)
        {
          if (v10 > 1667583312)
          {
            if (v10 != 1667583313)
            {
              if (v10 == 1667583569)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
                v13 = objc_claimAutoreleasedReturnValue();
                v14 = v6;
                v15 = v13;
                v16 = &unk_24C36DD70;
                goto LABEL_77;
              }
              goto LABEL_62;
            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DD58;
          }
          else
          {
            if (v10 != 1667331699)
            {
              if (v10 == 1667581779)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
                v13 = objc_claimAutoreleasedReturnValue();
                v14 = v6;
                v15 = v13;
                v16 = &unk_24C36DE90;
                goto LABEL_77;
              }
              goto LABEL_62;
            }
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DCB0;
          }
        }
        else if (v10 > 1667331682)
        {
          if (v10 != 1667331683)
          {
            if (v10 == 1667331685)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = v6;
              v15 = v13;
              v16 = &unk_24C36DD28;
              goto LABEL_77;
            }
            goto LABEL_62;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DCC8;
        }
        else
        {
          if (v10 != 1667330932)
          {
            if (v10 == 1667330933)
            {
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = v6;
              v15 = v13;
              v16 = &unk_24C36DE78;
              goto LABEL_77;
            }
            goto LABEL_62;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DE60;
        }
        goto LABEL_77;
      }
      if (v10 <= 1668113011)
      {
        if (v10 > 1668113004)
        {
          if (v10 != 1668113005)
          {
            if (v10 == 1668113011)
            {
              v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
              v14 = v6;
              v15 = v13;
              v16 = &unk_24C36DDB8;
              goto LABEL_77;
            }
            goto LABEL_62;
          }
          v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DDE8;
        }
        else
        {
          if (v10 != 1667584373)
          {
            if (v10 == 1668112996)
            {
              v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
              v14 = v6;
              v15 = v13;
              v16 = &unk_24C36DDA0;
              goto LABEL_77;
            }
            goto LABEL_62;
          }
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DD40;
        }
        goto LABEL_77;
      }
      if (v10 <= 1668117361)
      {
        if (v10 != 1668113012)
        {
          if (v10 == 1668115819)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DE18;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
        v14 = v6;
        v15 = v13;
        v16 = &unk_24C36DDD0;
LABEL_77:
        objc_msgSend(v14, "setObject:forKey:", v15, v16);
        goto LABEL_78;
      }
      if (v10 != 1836282996)
      {
        if (v10 == 1668117362)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DBF0;
          goto LABEL_77;
        }
LABEL_62:
        v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v18[0] = 67109888;
          v18[1] = v7;
          v19 = 1024;
          v20 = HIWORD(v8);
          v21 = 1024;
          v22 = v10 >> 8;
          v23 = 1024;
          v24 = v9;
          _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in play status response: %c%c%c%c", (uint8_t *)v18, 0x1Au);
        }
LABEL_78:

      }
      a3 = (const char *)&v12[v11];
      a4 = a4 - 8 - v11;
      if (!a4)
        return v6;
    }
    if (v10 <= 1667329643)
    {
      if (v10 <= 1667327588)
      {
        switch(v10)
        {
          case 1634951529:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", (((unint64_t)*((unsigned __int8 *)a3 + 8) << 56) | ((unint64_t)*((unsigned __int8 *)a3 + 9) << 48) | ((unint64_t)*((unsigned __int8 *)a3 + 10) << 40) | ((unint64_t)*((unsigned __int8 *)a3 + 11) << 32) | ((unint64_t)*((unsigned __int8 *)a3 + 12) << 24) | ((unint64_t)*((unsigned __int8 *)a3 + 13) << 16) | ((unint64_t)*((unsigned __int8 *)a3 + 14) << 8))+ *((unsigned __int8 *)a3 + 15));
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DD88;
            break;
          case 1667326322:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DCF8;
            break;
          case 1667326323:
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DCE0;
            goto LABEL_77;
          default:
            goto LABEL_62;
        }
      }
      else if (v10 > 1667329632)
      {
        if (v10 != 1667329633)
        {
          if (v10 == 1667329639)
          {
            v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DE00;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
        v14 = v6;
        v15 = v13;
        v16 = &unk_24C36DC20;
      }
      else
      {
        if (v10 != 1667327589)
        {
          if (v10 == 1667327603)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DC98;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v15 = v13;
        v16 = &unk_24C36DD10;
      }
    }
    else if (v10 > 1667330162)
    {
      if (v10 > 1667330914)
      {
        if (v10 != 1667330915)
        {
          if (v10 == 1667330920)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DC68;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v15 = v13;
        v16 = &unk_24C36DE30;
      }
      else
      {
        if (v10 != 1667330163)
        {
          if (v10 == 1667330672)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = v6;
            v15 = v13;
            v16 = &unk_24C36DC80;
            goto LABEL_77;
          }
          goto LABEL_62;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", *v12);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v15 = v13;
        v16 = &unk_24C36DC50;
      }
    }
    else
    {
      switch(v10)
      {
        case 1667329644:
          v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DC38;
          goto LABEL_77;
        case 1667329645:
        case 1667329647:
        case 1667329649:
        case 1667329650:
        case 1667329651:
          goto LABEL_62;
        case 1667329646:
          v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DC08;
          goto LABEL_77;
        case 1667329648:
          v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3 + 8, v11);
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DEA8;
          goto LABEL_77;
        case 1667329652:
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DE48;
          goto LABEL_77;
        default:
          if (v10 != 1667330156)
            goto LABEL_62;
          v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a3 + 8, v11);
          v14 = v6;
          v15 = v13;
          v16 = &unk_24C36DEC0;
          break;
      }
    }
    goto LABEL_77;
  }
  return v6;
}

+ (id)_parseErrorResponseWithBytes:(const char *)a3 length:(unint64_t)a4
{
  void *i;
  int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _DWORD v18[2];
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a4; a4 = a4 - 8 - v11)
  {
    v7 = *(unsigned __int8 *)a3;
    v8 = (v7 << 24) | (*((unsigned __int8 *)a3 + 1) << 16);
    v9 = *((unsigned __int8 *)a3 + 3);
    v10 = v9 | (*((unsigned __int8 *)a3 + 2) << 8) | v8;
    v11 = bswap32(*((_DWORD *)a3 + 1));
    v12 = a3 + 8;
    switch(v10)
    {
      case 0x61655243u:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = i;
        v15 = v13;
        v16 = &unk_24C36DF08;
        break;
      case 0x6D737473u:
        v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a3 + 8, v11, 4);
        v14 = i;
        v15 = v13;
        v16 = &unk_24C36DEF0;
        break;
      case 0x6D737474u:
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", bswap32(*((_DWORD *)a3 + 2)));
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = i;
        v15 = v13;
        v16 = &unk_24C36DED8;
        break;
      default:
        v13 = os_log_create("com.apple.amp.HomeSharing", "Library");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v18[0] = 67109888;
          v18[1] = v7;
          v19 = 1024;
          v20 = HIWORD(v8);
          v21 = 1024;
          v22 = v10 >> 8;
          v23 = 1024;
          v24 = v9;
          _os_log_impl(&dword_20AA9E000, v13, OS_LOG_TYPE_DEBUG, "Unhandled code in play status response: %c%c%c%c", (uint8_t *)v18, 0x1Au);
        }
        goto LABEL_9;
    }
    objc_msgSend(v14, "setObject:forKey:", v15, v16);
LABEL_9:

    a3 = &v12[v11];
  }
  return i;
}

+ (id)_parseListingItemWithBytes:(const char *)a3 length:(unsigned int)a4 usingHandler:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  unsigned __int8 *v12;
  unsigned int v13;
  id v14;
  const __CFString *v15;
  __CFString *v16;
  BOOL v17;
  __CFString *v19;
  id v20;

  v7 = a5;
  v8 = v7;
  if (v7)
  {
    (*((void (**)(id, const char *, _QWORD))v7 + 2))(v7, a3, a4);
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    while (a4)
    {
      v10 = *(_DWORD *)a3;
      v11 = *((_DWORD *)a3 + 1);
      v12 = (unsigned __int8 *)(a3 + 8);
      v13 = bswap32(v11);
      v19 = 0;
      v20 = 0;
      ParseItemPropertyCode(bswap32(v10), v12, v13, &v20, (const __CFString **)&v19);
      v14 = v20;
      v15 = v19;
      v16 = (__CFString *)v15;
      if (v14)
        v17 = v15 == 0;
      else
        v17 = 1;
      if (!v17)
        objc_msgSend(v9, "setObject:forKey:", v14, v15);
      a3 = (const char *)&v12[v13];
      a4 = a4 - 8 - v13;

    }
  }

  return v9;
}

uint64_t __73__HSResponseDataParser_enumerateDeletedItemsInResponseData_usingHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__HSResponseDataParser_enumerateItemsInResponseData_usingHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "parseItemWithBytes:length:usingHandler:", a2, a3, *(_QWORD *)(a1 + 32));
}

@end
