@implementation EKStructuredLocationSemanticIdentifierGenerator

+ (id)semanticIdentifierForLocationWithTitle:(id)a3 address:(id)a4 mapKitHandle:(id)a5 contactLabel:(id)a6 latitude:(id)a7 longitude:(id)a8 radius:(id)a9
{
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  float v26;
  double v27;
  float v28;
  double v29;
  float v30;
  uint64_t v32;

  v14 = (unint64_t)a3;
  v15 = (unint64_t)a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  if (!(v14 | v15))
  {
    if (v16)
    {
      objc_msgSend(v16, "base64EncodedStringWithOptions:", 0);
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v17)
    {
      v24 = v17;
    }
    else
    {
      v23 = 0;
      if (!v18 || !v19)
        goto LABEL_18;
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v18, "floatValue");
      v27 = v26;
      objc_msgSend(v19, "floatValue");
      v29 = v28;
      if (v20)
      {
        objc_msgSend(v20, "floatValue");
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%f:%f:%f"), *(_QWORD *)&v27, *(_QWORD *)&v29, v30);
      }
      else
      {
        objc_msgSend(v25, "stringWithFormat:", CFSTR("%f:%f"), *(_QWORD *)&v27, v28, v32);
      }
      v24 = (id)objc_claimAutoreleasedReturnValue();
    }
    v23 = v24;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v14)
    objc_msgSend(v21, "appendFormat:", CFSTR("TITLE=%@;"), v14);
  if (v15)
    objc_msgSend(v22, "appendFormat:", CFSTR("ADDRESS=%@;"), v15);
  v23 = (void *)objc_msgSend(v22, "copy");

LABEL_18:
  return v23;
}

@end
