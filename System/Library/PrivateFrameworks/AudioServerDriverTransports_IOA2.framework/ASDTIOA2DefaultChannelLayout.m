@implementation ASDTIOA2DefaultChannelLayout

+ (id)addressForDirection:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BE0A260]), "initWithAddress:", (*(_QWORD *)&a3 << 32) | 0x73726464, 0);
}

+ (id)forIOA2Device:(id)a3 andScope:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIOA2Device:andScope:", v6, v4);

  return v7;
}

- (ASDTIOA2DefaultChannelLayout)initWithIOA2Device:(id)a3 andScope:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  ASDTIOA2DefaultChannelLayout *v14;
  objc_super v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v4 = *(_QWORD *)&a4;
  v18[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "_channelLayoutForDirection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = *MEMORY[0x24BE0A5A8];
    v18[0] = &unk_250850350;
    v9 = *MEMORY[0x24BE0A5A0];
    v17[0] = v8;
    v17[1] = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE0A568];
    v18[1] = v10;
    v18[2] = &unk_250850368;
    v12 = *MEMORY[0x24BE0A598];
    v17[2] = v11;
    v17[3] = v12;
    v17[4] = *MEMORY[0x24BE0A580];
    v18[3] = v7;
    v18[4] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16.receiver = self;
    v16.super_class = (Class)ASDTIOA2DefaultChannelLayout;
    self = -[ASDTRawProperty initWithConfig:](&v16, sel_initWithConfig_, v13);

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)description
{
  void *v3;
  unsigned int v4;
  const char *v5;
  void *v6;
  void *v7;
  void *v8;
  _DWORD *v9;
  unsigned int v10;
  uint64_t v11;
  uint8x8_t v12;
  uint64_t v13;
  const __CFString *v14;
  std::vector<char>::pointer begin;
  unint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  char *v20;
  unsigned int v21;
  const char *v22;
  unsigned int v23;
  std::vector<char> v25;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = -[ASDCustomProperty scope](self, "scope");
  v5 = "Output";
  if (v4 == 1768845428)
    v5 = "Input";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%s Channel Layout:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDTCustomProperty propertyValue](self, "propertyValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") > 0x1F)
  {
    v9 = (_DWORD *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v10 = v9[2];
    if (v10 <= 1)
      v10 = 1;
    std::vector<char>::vector(&v25, 20 * v10 + 12);
    memcpy(v25.__begin_, v9, 20 * v9[2] + 12);
    if (*(_DWORD *)v25.__begin_ == 0x10000)
    {
      v12 = (uint8x8_t)vcnt_s8((int8x8_t)*((unsigned int *)v25.__begin_ + 1));
      v12.i16[0] = vaddlv_u8(v12);
      v11 = v12.u32[0];
    }
    else if (*(_DWORD *)v25.__begin_)
    {
      v11 = (unsigned __int16)*(_DWORD *)v25.__begin_;
    }
    else
    {
      v11 = *((unsigned int *)v25.__begin_ + 2);
    }
    objc_msgSend(v6, "appendFormat:", CFSTR(" count: %u"), v11);
    v13 = *(unsigned int *)v25.__begin_;
    if ((_DWORD)v13)
    {
      if ((v13 & 0x10000) != 0)
      {
        v13 = *((unsigned int *)v25.__begin_ + 1);
        v14 = CFSTR(", bitmap: %x");
      }
      else
      {
        v14 = CFSTR(", tag: %x");
      }
      objc_msgSend(v6, "appendFormat:", v14, v13);
    }
    else
    {
      objc_msgSend(v6, "appendString:", CFSTR(", channels: "));
      begin = v25.__begin_;
      v16 = *((unsigned int *)v25.__begin_ + 2);
      if (v16 > (v25.__end_ - v25.__begin_ - 12) / 0x14uLL)
LABEL_106:
        __assert_rtn("GetNumberChannelDescriptions", "CoreAudioBaseTypes.hpp", 2237, "GetAudioChannelLayout().mNumberChannelDescriptions <= (mStorage.size() - kHeaderSize) / sizeof(AudioChannelDescription)");
      v17 = 0;
      v18 = (const char *)&unk_236D7C5F7;
      v19 = -1;
      while (++v19 < v16)
      {
        v20 = &begin[v17];
        v21 = ((*(_DWORD *)&begin[v17 + 12] & 0xFFF0000u) - 0x10000) >> 16;
        if (v21 >= 4)
        {
          v23 = (unsigned __int16)*(_DWORD *)&begin[v17 + 12];
          if (v23 > 0xC7)
          {
            if ((unsigned __int16)*(_DWORD *)&begin[v17 + 12] > 0x12Cu)
            {
              switch((unsigned __int16)*(_DWORD *)&begin[v17 + 12])
              {
                case 0x12Du:
                  v22 = "headphones-left";
                  break;
                case 0x12Eu:
                  v22 = "headphones-right";
                  break;
                case 0x12Fu:
                  goto LABEL_100;
                case 0x130u:
                  v22 = "click-track";
                  break;
                case 0x131u:
                  v22 = "foreign-language";
                  break;
                default:
                  if (v23 == 400)
                  {
                    v22 = "discrete";
                  }
                  else if (v23 == 500)
                  {
                    v22 = "hoa-acn";
                  }
                  else
                  {
LABEL_100:
                    v22 = "unknown";
                  }
                  break;
              }
            }
            else
            {
              switch((unsigned __int16)*(_DWORD *)&begin[v17 + 12])
              {
                case 0xC8u:
                  v22 = "ambisonic-w";
                  break;
                case 0xC9u:
                  v22 = "ambisonic-x";
                  break;
                case 0xCAu:
                  v22 = "ambisonic-y";
                  break;
                case 0xCBu:
                  v22 = "ambisonic-z";
                  break;
                case 0xCCu:
                  v22 = "mid";
                  break;
                case 0xCDu:
                  v22 = "side";
                  break;
                case 0xCEu:
                  v22 = "x";
                  break;
                case 0xCFu:
                  v22 = "y";
                  break;
                case 0xD0u:
                  v22 = "binaural-left";
                  break;
                case 0xD1u:
                  v22 = "binaural-right";
                  break;
                default:
                  goto LABEL_100;
              }
            }
          }
          else
          {
            v22 = "unused";
            switch("unused")
            {
              case 0u:
                break;
              case 1u:
                v22 = "left";
                break;
              case 2u:
                v22 = "right";
                break;
              case 3u:
                v22 = "center";
                break;
              case 4u:
                v22 = "subwoofer";
                break;
              case 5u:
                v22 = "surround-left";
                break;
              case 6u:
                v22 = "surround-right";
                break;
              case 7u:
                v22 = "center-left";
                break;
              case 8u:
                v22 = "center-right";
                break;
              case 9u:
                v22 = "surround-center";
                break;
              case 0xAu:
                v22 = "surround-left-direct";
                break;
              case 0xBu:
                v22 = "surround-right-direct";
                break;
              case 0xCu:
                v22 = "top-surround-center";
                break;
              case 0xDu:
                v22 = "top-left";
                break;
              case 0xEu:
                v22 = "top-center";
                break;
              case 0xFu:
                v22 = "top-right";
                break;
              case 0x10u:
                v22 = "back-top-left";
                break;
              case 0x11u:
                v22 = "back-top-center";
                break;
              case 0x12u:
                v22 = "back-top-right";
                break;
              case 0x21u:
                v22 = "rear-surround-left";
                break;
              case 0x22u:
                v22 = "rear-surround-right";
                break;
              case 0x23u:
                v22 = "wide-left";
                break;
              case 0x24u:
                v22 = "wide-right";
                break;
              case 0x25u:
                v22 = "subwoofer-2";
                break;
              case 0x26u:
                v22 = "left-total";
                break;
              case 0x27u:
                v22 = "right-total";
                break;
              case 0x28u:
                v22 = "hearing-impaired";
                break;
              case 0x29u:
                v22 = "narration";
                break;
              case 0x2Au:
                v22 = "mono";
                break;
              case 0x2Bu:
                v22 = "dialog-mix";
                break;
              case 0x2Cu:
                v22 = "surround-center-direct";
                break;
              case 0x2Du:
                v22 = "haptic";
                break;
              case 0x31u:
                v22 = "middle-top-left";
                break;
              case 0x33u:
                v22 = "middle-top-right";
                break;
              case 0x34u:
                v22 = "rear-top-left";
                break;
              case 0x35u:
                v22 = "rear-top-center";
                break;
              case 0x36u:
                v22 = "rear-top-right";
                break;
              case 0x37u:
                v22 = "surround-side-left";
                break;
              case 0x38u:
                v22 = "surround-side-right";
                break;
              case 0x39u:
                v22 = "bottom-left";
                break;
              case 0x3Au:
                v22 = "bottom-right";
                break;
              case 0x3Bu:
                v22 = "bottom-center";
                break;
              case 0x3Cu:
                v22 = "surround-top-left";
                break;
              case 0x3Du:
                v22 = "surround-top-right";
                break;
              case 0x3Eu:
                v22 = "subwoofer-3";
                break;
              case 0x3Fu:
                v22 = "surround-back-left";
                break;
              case 0x40u:
                v22 = "surround-back-right";
                break;
              case 0x41u:
                v22 = "screen-edge-left";
                break;
              case 0x42u:
                v22 = "screen-edge-right";
                break;
              case 0x64u:
                v22 = "coordinates";
                break;
              default:
                goto LABEL_100;
            }
          }
        }
        else
        {
          v22 = off_25084BCE0[(__int16)v21];
        }
        objc_msgSend(v6, "appendFormat:", CFSTR("%s%s"), v18, v22);
        if ((*((_DWORD *)v20 + 3) & 0xFFF0000u) - 0x10000 >= 0x40000)
        {
          if ((unsigned __int16)*((_DWORD *)v20 + 3) == 100)
            objc_msgSend(v6, "appendFormat:", CFSTR(" (%1.3f, %1.3f, %1.3f)"), *(float *)&begin[v17 + 20], *(float *)&begin[v17 + 24], *(float *)&begin[v17 + 28]);
        }
        else
        {
          objc_msgSend(v6, "appendFormat:", CFSTR(" %u"), (unsigned __int16)*((_DWORD *)v20 + 3));
        }
        if (*(_DWORD *)&begin[v17 + 16])
          objc_msgSend(v6, "appendFormat:", CFSTR(", flags: %x"), *(unsigned int *)&begin[v17 + 16]);
        v17 += 20;
        begin = v25.__begin_;
        v16 = *((unsigned int *)v25.__begin_ + 2);
        v18 = "; ";
        if (v16 > (v25.__end_ - v25.__begin_ - 12) / 0x14uLL)
          goto LABEL_106;
      }
    }
    v8 = (void *)objc_msgSend(v6, "copy");
    if (v25.__begin_)
    {
      v25.__end_ = v25.__begin_;
      operator delete(v25.__begin_);
    }
  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR(" nil"));
    v8 = (void *)objc_msgSend(v6, "copy");
  }

  return v8;
}

@end
