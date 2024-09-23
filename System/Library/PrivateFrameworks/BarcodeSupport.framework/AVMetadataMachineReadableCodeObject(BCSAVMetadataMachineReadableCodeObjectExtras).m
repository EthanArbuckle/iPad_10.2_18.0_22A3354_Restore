@implementation AVMetadataMachineReadableCodeObject(BCSAVMetadataMachineReadableCodeObjectExtras)

- (uint64_t)_bcs_probablyContainsSameCodeInBasicDescriptor:()BCSAVMetadataMachineReadableCodeObjectExtras
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(a1, "basicDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = 0;
  if (v4 && v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("BarcodeType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BarcodeType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9))
    {
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.AppClipCode")))
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RawData"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RawData"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Version"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Version"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqualToData:", v11))
          v7 = objc_msgSend(v12, "isEqualToNumber:", v13);
        else
          v7 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SymbolVersion"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("QRMASK"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ErrorCorrectionLevel"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SymbolVersion"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("QRMASK"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ErrorCorrectionLevel"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v12, "integerValue");
        v23 = v14;
        if (v16 == objc_msgSend(v15, "integerValue")
          && (v17 = objc_msgSend(v11, "charValue"), v17 == objc_msgSend(v14, "charValue")))
        {
          v10 = v22;
          v18 = objc_msgSend(v22, "charValue");
          if (v18 == objc_msgSend(v13, "charValue"))
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BarcodeRawData"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BarcodeRawData"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v7 = objc_msgSend(v21, "isEqualToData:", v20);

          }
          else
          {
            v7 = 0;
          }
        }
        else
        {
          v7 = 0;
          v10 = v22;
        }

      }
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

@end
