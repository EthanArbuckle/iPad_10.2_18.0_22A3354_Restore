@implementation CLKComplicationTemplateGraphicBezelCircularText

- (CLKComplicationTemplateGraphicBezelCircularText)initWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate
{
  return -[CLKComplicationTemplateGraphicBezelCircularText initWithCircularTemplate:textProvider:](self, "initWithCircularTemplate:textProvider:", circularTemplate, 0);
}

- (CLKComplicationTemplateGraphicBezelCircularText)initWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate textProvider:(CLKTextProvider *)textProvider
{
  CLKComplicationTemplateGraphicCircular *v6;
  CLKTextProvider *v7;
  CLKComplicationTemplateGraphicBezelCircularText *v8;
  CLKComplicationTemplateGraphicBezelCircularText *v9;
  objc_super v11;

  v6 = circularTemplate;
  v7 = textProvider;
  v11.receiver = self;
  v11.super_class = (Class)CLKComplicationTemplateGraphicBezelCircularText;
  v8 = -[CLKComplicationTemplate initPrivate](&v11, sel_initPrivate);
  v9 = v8;
  if (v8)
  {
    -[CLKComplicationTemplateGraphicBezelCircularText setCircularTemplate:](v8, "setCircularTemplate:", v6);
    -[CLKComplicationTemplateGraphicBezelCircularText setTextProvider:](v9, "setTextProvider:", v7);
  }

  return v9;
}

+ (CLKComplicationTemplateGraphicBezelCircularText)templateWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate
{
  CLKComplicationTemplateGraphicCircular *v4;
  void *v5;

  v4 = circularTemplate;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCircularTemplate:", v4);

  return (CLKComplicationTemplateGraphicBezelCircularText *)v5;
}

+ (CLKComplicationTemplateGraphicBezelCircularText)templateWithCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate textProvider:(CLKTextProvider *)textProvider
{
  CLKTextProvider *v6;
  CLKComplicationTemplateGraphicCircular *v7;
  void *v8;

  v6 = textProvider;
  v7 = circularTemplate;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCircularTemplate:textProvider:", v7, v6);

  return (CLKComplicationTemplateGraphicBezelCircularText *)v8;
}

- (int64_t)compatibleFamily
{
  return 9;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, uint64_t, uint64_t, char *))a3 + 2))(a3, CFSTR("textProvider"), 1, 1, &v3);
}

- (void)_enumerateEmbeddedTemplateKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("circularTemplate"), 0, 1, &v3);
}

- (id)_validEmbeddedTemplateClassNamesForKey:(id)a3
{
  if (_validEmbeddedTemplateClassNamesForKey__onceToken != -1)
    dispatch_once(&_validEmbeddedTemplateClassNamesForKey__onceToken, &__block_literal_global_1047);
  return (id)_validEmbeddedTemplateClassNamesForKey____classNames;
}

void __90__CLKComplicationTemplateGraphicBezelCircularText__validEmbeddedTemplateClassNamesForKey___block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[18];

  v36[16] = *MEMORY[0x24BDAC8D0];
  v31 = (void *)MEMORY[0x24BDBCF20];
  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v35;
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v34;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v33;
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v32;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v30;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v29;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v28;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v8;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v10;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v12;
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v14;
  v15 = (objc_class *)objc_opt_class();
  NSStringFromClass(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v36[11] = v16;
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[12] = v18;
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[13] = v20;
  v21 = (objc_class *)objc_opt_class();
  NSStringFromClass(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[14] = v22;
  v23 = (objc_class *)objc_opt_class();
  NSStringFromClass(v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[15] = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v25);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)_validEmbeddedTemplateClassNamesForKey____classNames;
  _validEmbeddedTemplateClassNamesForKey____classNames = v26;

}

- (BOOL)needsSerializableCopy
{
  void *v2;
  char v3;

  -[CLKComplicationTemplateGraphicBezelCircularText circularTemplate](self, "circularTemplate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsSerializableCopy");

  return v3;
}

- (id)serializableCopyWithImageProviders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CLKComplicationTemplateGraphicBezelCircularText *v7;
  void *v8;
  CLKComplicationTemplateGraphicBezelCircularText *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = (id)objc_opt_new();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__CLKComplicationTemplateGraphicBezelCircularText_serializableCopyWithImageProviders___block_invoke;
  v11[3] = &unk_24CBF9C38;
  v11[4] = &v12;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);
  -[CLKComplicationTemplateGraphicBezelCircularText circularTemplate](self, "circularTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serializableCopyWithImageProviders:", v13[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [CLKComplicationTemplateGraphicBezelCircularText alloc];
  -[CLKComplicationTemplateGraphicBezelCircularText textProvider](self, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CLKComplicationTemplateGraphicBezelCircularText initWithCircularTemplate:textProvider:](v7, "initWithCircularTemplate:textProvider:", v6, v8);

  -[CLKComplicationTemplate setSdkVersion:](v9, "setSdkVersion:", -[CLKComplicationTemplate sdkVersion](self, "sdkVersion"));
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __86__CLKComplicationTemplateGraphicBezelCircularText_serializableCopyWithImageProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("circularTemplate"));

    if (v7)
    {
      v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

    }
  }

}

- (CLKComplicationTemplateGraphicCircular)circularTemplate
{
  return self->_circularTemplate;
}

- (void)setCircularTemplate:(CLKComplicationTemplateGraphicCircular *)circularTemplate
{
  objc_setProperty_nonatomic_copy(self, a2, circularTemplate, 72);
}

- (CLKTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(CLKTextProvider *)textProvider
{
  objc_setProperty_nonatomic_copy(self, a2, textProvider, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_circularTemplate, 0);
}

@end
