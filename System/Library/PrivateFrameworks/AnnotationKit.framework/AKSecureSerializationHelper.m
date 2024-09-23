@implementation AKSecureSerializationHelper

+ (id)dataForSecureCodingCompliantObject:(id)a3 withOptionalKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)MEMORY[0x22E2C10E4]();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    v9 = (void *)*MEMORY[0x24BDD0E88];
    if (v6)
      v9 = v6;
    v10 = v9;
    objc_msgSend(v8, "encodeObject:forKey:", v5, v10);
    objc_msgSend(v8, "encodedData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)secureCodingCompliantObjectForData:(id)a3 ofClasses:(id)a4 withOptionalKey:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    v10 = (void *)MEMORY[0x22E2C10E4]();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v7, 0);
    v12 = (void *)*MEMORY[0x24BDD0E88];
    if (v9)
      v12 = v9;
    v13 = v12;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "decodeObjectOfClasses:forKey:", v14, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "finishDecoding");
    if (!v15)
    {
      v16 = os_log_create("com.apple.annotationkit", "Serialization");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        sub_22907F72C((uint64_t)v8, v16, v17, v18, v19, v20, v21, v22);

    }
    objc_autoreleasePoolPop(v10);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (void)encodeTextPropertiesOfAnnotation:(id)a3 withCoder:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v13, "annotationText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithAttributedString:", v8);
    objc_msgSend(a1, "_encodeAttributedStringAsRTFData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("annotationTextRTF"));
    objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("attributedString"));

  }
  objc_msgSend(v13, "typingAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_encodeTextAttributesAsRTFData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v12, CFSTR("typingAttributesRTF"));
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("typingAttributes"));

}

+ (void)decodeTextPropertiesOfAnnotation:(id)a3 withSecureCoder:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "requiresSecureCoding"))
  {
    objc_msgSend(a1, "_decodeTextPropertiesForAnnotation:withSecureCoder:", v6, v7);
  }
  else
  {
    v8 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_22907F790();

    objc_msgSend(v6, "setEditingDisabled:", 1);
  }

}

+ (id)encodeColor:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "colorUsingSRGBColorSpace");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = objc_msgSend(v4, "CGColor");
  objc_msgSend(MEMORY[0x24BDBF638], "colorWithCGColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataForSecureCodingCompliantObject:withOptionalKey:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)decodeColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secureCodingCompliantObjectForData:ofClasses:withOptionalKey:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "akColorWithCIColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)encodeFont:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "fontDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dataForSecureCodingCompliantObject:withOptionalKey:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)decodeFont:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "secureCodingCompliantObjectForData:ofClasses:withOptionalKey:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v6, 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)encodeTextAttributes:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(a1, "_encodeTextAttributesAsRTFData:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)decodeTextAttributes:(id)a3
{
  if (!a3)
    return 0;
  objc_msgSend(a1, "_decodeTextAttributesFromRTFData:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)_decodeTextPropertiesForAnnotation:(id)a3 withSecureCoder:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "akSerializationVersion") < 1)
  {
    v14 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_22907F790();
    goto LABEL_16;
  }
  v23 = 0;
  v24 = 0;
  objc_msgSend(a1, "_decodeRTFTextPropertiesWithSecureCoder:annotationTextRTF:typingAttributesRTF:", v7, &v24, &v23);
  v8 = v24;
  v9 = v23;
  if (!v9)
  {
    v15 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_22907F7BC(v15);

    v14 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_22907F790();
LABEL_16:

    objc_msgSend(v6, "setEditingDisabled:", 1);
    goto LABEL_17;
  }
  v10 = v9;
  if (v8)
  {
    objc_msgSend(a1, "_decodeAttributedStringFromRTFData:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = +[AKTextAnnotationAttributeHelper newTextStorageOriginalFontSavvyWithAttributedString:](AKTextAnnotationAttributeHelper, "newTextStorageOriginalFontSavvyWithAttributedString:", v11);
      objc_msgSend(v6, "setAnnotationText:", v12);

    }
  }
  objc_msgSend(a1, "_decodeTextAttributesFromRTFData:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v6, "setTypingAttributes:", v13);

LABEL_17:
  objc_msgSend(v6, "typingAttributes");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16
    || (v17 = (void *)v16,
        objc_msgSend(v6, "typingAttributes"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = objc_msgSend(v18, "count"),
        v18,
        v17,
        !v19))
  {
    objc_msgSend(v6, "annotationText");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v6, "annotationText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "attributesAtIndex:effectiveRange:", 0, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTypingAttributes:", v22);

    }
    else
    {
      +[AKAttributeController defaultTextAttributes](AKAttributeController, "defaultTextAttributes");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTypingAttributes:", v21);
    }

  }
}

+ (void)_decodeRTFTextPropertiesWithSecureCoder:(id)a3 annotationTextRTF:(id *)a4 typingAttributesRTF:(id *)a5
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "containsValueForKey:", CFSTR("annotationTextRTF")))
  {
    objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("annotationTextRTF"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v9, "containsValueForKey:", CFSTR("typingAttributesRTF")))
  {
    v8 = 0;
    if (!a4)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typingAttributesRTF"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_8:
    *a4 = objc_retainAutorelease(v7);
LABEL_9:
  if (a5)
    *a5 = objc_retainAutorelease(v8);

}

+ (id)_encodeAttributedStringAsRTFData:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BDD1688];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithAttributedString:", v4);
    v6 = objc_msgSend(v4, "length");
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = sub_228FE66AC;
    v25[3] = &unk_24F1A7568;
    v7 = v5;
    v26 = v7;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0x100000, v25);

    v8 = objc_msgSend(v7, "length");
    v9 = *MEMORY[0x24BDF65F0];
    v28[0] = *MEMORY[0x24BDF6638];
    v10 = *MEMORY[0x24BDF6648];
    v27[0] = v9;
    v27[1] = v10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v11;
    v27[2] = *MEMORY[0x24BDF66A8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v7, "dataFromRange:documentAttributes:error:", 0, v8, v13, &v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;

    if (v15)
    {
      v16 = os_log_create("com.apple.annotationkit", "Serialization");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        sub_22907F838((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

+ (id)_decodeAttributedStringFromRTFData:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x24BDD1458];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = *MEMORY[0x24BDF65F0];
  v31[0] = *MEMORY[0x24BDF6638];
  v7 = *MEMORY[0x24BDF6648];
  v30[0] = v6;
  v30[1] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v8;
  v30[2] = *MEMORY[0x24BDF66A8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v11 = (void *)objc_msgSend(v5, "initWithData:options:documentAttributes:error:", v4, v10, 0, &v29);

  v12 = v29;
  if (v12)
  {
    v13 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      sub_22907F89C((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    v20 = 0;
    v21 = v11;
  }
  else
  {
    if (!v11)
    {
      v20 = 0;
      goto LABEL_12;
    }
    v21 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v21, "attributesAtIndex:effectiveRange:", 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v23, "mutableCopy");

    v24 = *MEMORY[0x24BDF66D0];
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x24BDF66D0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
      -[NSObject removeObjectForKey:](v13, "removeObjectForKey:", v24);
    v26 = *MEMORY[0x24BDF6628];
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x24BDF6628]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v27, "mutableCopy");

    objc_msgSend(v28, "setDefaultTabInterval:", 0.0);
    objc_msgSend(v28, "setAllowsDefaultTighteningForTruncation:", 1);
    -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v28, v26);
    objc_msgSend(v21, "setAttributes:range:", v13, 0, objc_msgSend(v21, "length"));
    v20 = (void *)objc_msgSend(v21, "copy");

  }
LABEL_12:

  return v20;
}

+ (id)_encodeTextAttributesAsRTFData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDD1458];
    v5 = a3;
    v6 = (void *)objc_msgSend([v4 alloc], "initWithString:attributes:", CFSTR("a"), v5);

    objc_msgSend(a1, "_encodeAttributedStringAsRTFData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

+ (id)_decodeTextAttributesFromRTFData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(a1, "_decodeAttributedStringFromRTFData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend(v3, "length") != 1)
  {
    v6 = os_log_create("com.apple.annotationkit", "Serialization");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_22907F900();

    v4 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "attributesAtIndex:effectiveRange:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v5;
}

@end
