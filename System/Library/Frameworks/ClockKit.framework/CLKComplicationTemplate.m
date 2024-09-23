@implementation CLKComplicationTemplate

- (id)initPrivate
{
  CLKComplicationTemplate *v2;
  uint64_t v3;
  NSDate *creationDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLKComplicationTemplate;
  v2 = -[CLKComplicationTemplate init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

  }
  return v2;
}

+ (CLKComplicationTemplate)new
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___CLKComplicationTemplate;
  return (CLKComplicationTemplate *)objc_msgSendSuper2(&v3, "new");
}

- (void)beginUpdatesForClient:(id)a3
{
  id v4;
  NSHashTable *activeClients;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  activeClients = self->_activeClients;
  v8 = v4;
  if (!activeClients)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_activeClients;
    self->_activeClients = v6;

    v4 = v8;
    activeClients = self->_activeClients;
  }
  -[NSHashTable addObject:](activeClients, "addObject:", v4);
  -[CLKComplicationTemplate _setProvidersPaused:](self, "_setProvidersPaused:", 0);

}

- (void)endUpdatesForClient:(id)a3
{
  -[NSHashTable removeObject:](self->_activeClients, "removeObject:", a3);
  if (!-[NSHashTable count](self->_activeClients, "count"))
    -[CLKComplicationTemplate _setProvidersPaused:](self, "_setProvidersPaused:", 1);
}

- (BOOL)hasSubMinuteUpdateRate
{
  uint64_t v3;
  BOOL v4;
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke;
  v9[3] = &unk_24CBF91C0;
  v9[4] = self;
  v9[5] = &v10;
  -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v9);
  if (*((_BYTE *)v11 + 24))
    goto LABEL_5;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_2;
  v8[3] = &unk_24CBF91C0;
  v8[4] = self;
  v8[5] = &v10;
  -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](self, "_enumerateGaugeProviderKeysWithBlock:", v8);
  if (*((_BYTE *)v11 + 24))
    goto LABEL_5;
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_3;
  v7[3] = &unk_24CBF91C0;
  v7[4] = self;
  v7[5] = &v10;
  -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v7);
  if (*((_BYTE *)v11 + 24)
    || (v6[0] = v3,
        v6[1] = 3221225472,
        v6[2] = __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_4,
        v6[3] = &unk_24CBF91C0,
        v6[4] = self,
        v6[5] = &v10,
        -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v6), *((_BYTE *)v11 + 24)))
  {
LABEL_5:
    v4 = 1;
  }
  else
  {
    -[CLKComplicationTemplate _enumerateSwiftUIViewDataKeysWithBlock:](self, "_enumerateSwiftUIViewDataKeysWithBlock:", &__block_literal_global_1);
    v4 = *((_BYTE *)v11 + 24) != 0;
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

void __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "updateFrequency") >= 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }

}

void __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "needsTimerUpdates"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }

}

void __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "needsTimerUpdates"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }

}

void __49__CLKComplicationTemplate_hasSubMinuteUpdateRate__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "hasSubMinuteUpdateRate"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }

}

- (BOOL)isCompatibleWithFamily:(int64_t)a3
{
  return -[CLKComplicationTemplate compatibleFamily](self, "compatibleFamily") == a3;
}

- (void)setSDKVersionFromLS:(id)a3
{
  if (a3)
    objc_msgSend(a3, "compare:options:", CFSTR("15.0"), 64);
  -[CLKComplicationTemplate setSdkVersion:](self, "setSdkVersion:");
}

- (void)setSdkVersion:(int64_t)a3
{
  _QWORD v3[6];

  if (!self->_finalized)
  {
    self->_sdkVersion = a3;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __41__CLKComplicationTemplate_setSdkVersion___block_invoke;
    v3[3] = &unk_24CBF9228;
    v3[4] = self;
    v3[5] = a3;
    -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v3);
  }
}

void __41__CLKComplicationTemplate_setSdkVersion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSdkVersion:", *(_QWORD *)(a1 + 40));

}

- (int64_t)timeTravelUpdateFrequency
{
  uint64_t v3;
  int64_t v4;
  _QWORD v6[6];
  _QWORD v7[6];
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke;
  v8[3] = &unk_24CBF91C0;
  v8[4] = self;
  v8[5] = &v9;
  -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke_2;
  v7[3] = &unk_24CBF91C0;
  v7[4] = self;
  v7[5] = &v9;
  -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v7);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke_3;
  v6[3] = &unk_24CBF91C0;
  v6[4] = self;
  v6[5] = &v9;
  -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v6);
  v4 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v4;
}

void __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = objc_msgSend(v6, "timeTravelUpdateFrequency");
  if (v3 <= v4)
    v5 = v4;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

}

void __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = objc_msgSend(v6, "timeTravelUpdateFrequency");
  if (v3 <= v4)
    v5 = v4;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

}

void __52__CLKComplicationTemplate_timeTravelUpdateFrequency__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v4 = objc_msgSend(v6, "timeTravelUpdateFrequency");
  if (v3 <= v4)
    v5 = v4;
  else
    v5 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v5;

}

- (id)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (id)viewDataKeyForSwiftUIViewKey:(id)a3
{
  return 0;
}

- (id)viewDataForSwiftUIViewKey:(id)a3
{
  return 0;
}

- (BOOL)validateWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v12[9];
  _QWORD v13[9];
  _QWORD v14[8];
  _QWORD v15[8];
  _QWORD v16[8];
  _QWORD v17[8];
  _QWORD v18[8];
  _QWORD v19[8];
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v25 = 0;
  v26[0] = &v25;
  v26[1] = 0x3032000000;
  v26[2] = __Block_byref_object_copy_;
  v26[3] = __Block_byref_object_dispose_;
  v27 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v5 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke;
  v20[3] = &unk_24CBF9250;
  v20[4] = self;
  v20[5] = &v25;
  v20[6] = &v21;
  v20[7] = &v28;
  -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v20);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_21;
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_2;
  v19[3] = &unk_24CBF9278;
  v19[4] = self;
  v19[5] = &v25;
  v19[6] = &v21;
  v19[7] = &v28;
  -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](self, "_enumerateImageProviderKeysWithBlock:", v19);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_21;
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_3;
  v18[3] = &unk_24CBF9250;
  v18[4] = self;
  v18[5] = &v25;
  v18[6] = &v21;
  v18[7] = &v28;
  -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v18);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_21;
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_4;
  v17[3] = &unk_24CBF92A0;
  v17[4] = self;
  v17[5] = &v25;
  v17[6] = &v21;
  v17[7] = &v28;
  -[CLKComplicationTemplate _enumerateIntegerKeysWithBlock:](self, "_enumerateIntegerKeysWithBlock:", v17);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_21;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_5;
  v16[3] = &unk_24CBF92C8;
  v16[4] = self;
  v16[5] = &v25;
  v16[6] = &v21;
  v16[7] = &v28;
  -[CLKComplicationTemplate _enumerateFloatKeysWithBlock:](self, "_enumerateFloatKeysWithBlock:", v16);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_21;
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_6;
  v15[3] = &unk_24CBF9250;
  v15[4] = self;
  v15[5] = &v25;
  v15[6] = &v21;
  v15[7] = &v28;
  -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](self, "_enumerateGaugeProviderKeysWithBlock:", v15);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_21;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_7;
  v14[3] = &unk_24CBF92F0;
  v14[4] = self;
  v14[5] = &v25;
  v14[6] = &v21;
  v14[7] = &v28;
  -[CLKComplicationTemplate _enumerateFullColorImageProviderKeysWithBlock:](self, "_enumerateFullColorImageProviderKeysWithBlock:", v14);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_21;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_8;
  v13[3] = &unk_24CBF9318;
  v13[4] = self;
  v13[5] = &v25;
  v13[6] = &v21;
  v13[7] = &v28;
  v13[8] = a3;
  -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v13);
  if (!*((_BYTE *)v29 + 24))
    goto LABEL_21;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_9;
  v12[3] = &unk_24CBF9368;
  v12[4] = self;
  v12[5] = &v28;
  v12[6] = &v25;
  v12[7] = &v21;
  v12[8] = a3;
  -[CLKComplicationTemplate _enumerateSwiftUIViewKeysWithBlock:](self, "_enumerateSwiftUIViewKeysWithBlock:", v12);
  if (!*((_BYTE *)v29 + 24))
  {
LABEL_21:
    if (*(_QWORD *)(v26[0] + 40))
    {
      if (*((_BYTE *)v22 + 24))
      {
        CLKLoggingObjectForDomain(10);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
          -[CLKComplicationTemplate validateWithError:].cold.1((uint64_t)v26, v6);

      }
      if (a3 && !*a3)
      {
        v7 = (void *)MEMORY[0x24BDD1540];
        v8 = *(_QWORD *)(v26[0] + 40);
        v32 = *MEMORY[0x24BDD0FC8];
        v33[0] = v8;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("CLKComplicationTimelineErrorDomain"), 2, v9);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  v10 = *((_BYTE *)v29 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v28, 8);
  return v10;
}

void __45__CLKComplicationTemplate_validateWithError___block_invoke(uint64_t a1, void *a2, char a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  id v19;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 && (a3 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_opt_class();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler."), v19, v11, objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v15 = a1 + 56;
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 24) = 0;
    *a5 = 1;
    goto LABEL_10;
  }
  v16 = *(_QWORD *)(a1 + 56);
  v15 = a1 + 56;
  v17 = *(unsigned __int8 *)(*(_QWORD *)(v16 + 8) + 24);
  if (v8)
    v18 = v17 == 0;
  else
    v18 = 1;
  if (!v18 && (objc_msgSend(v8, "validate") & 1) == 0)
    goto LABEL_9;
LABEL_10:

}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_2(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  id v22;

  v22 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 && (a3 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    v14 = objc_opt_class();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler."), v22, v14, objc_opt_class());
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v18 = a1 + 56;
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v18 + 8) + 24) = 0;
    *a8 = 1;
    goto LABEL_10;
  }
  v19 = *(_QWORD *)(a1 + 56);
  v18 = a1 + 56;
  v20 = *(unsigned __int8 *)(*(_QWORD *)(v19 + 8) + 24);
  if (v11)
    v21 = v20 == 0;
  else
    v21 = 1;
  if (!v21 && (objc_msgSend(v11, "validate") & 1) == 0)
    goto LABEL_9;
LABEL_10:

}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_3(uint64_t a1, void *a2, char a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  id v19;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 && (a3 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_opt_class();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler."), v19, v11, objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v15 = a1 + 56;
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 24) = 0;
    *a5 = 1;
    goto LABEL_10;
  }
  v16 = *(_QWORD *)(a1 + 56);
  v15 = a1 + 56;
  v17 = *(unsigned __int8 *)(*(_QWORD *)(v16 + 8) + 24);
  if (v8)
    v18 = v17 == 0;
  else
    v18 = 1;
  if (!v18 && (objc_msgSend(v8, "validate") & 1) == 0)
    goto LABEL_9;
LABEL_10:

}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4, _BYTE *a5)
{
  uint64_t (**v8)(id, uint64_t);
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v8 && (v8[2](v8, v10) & 1) == 0)
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@: invalid value for %@: %@"), v12, v17, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a5 = 1;
  }

}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4, _BYTE *a5)
{
  uint64_t (**v8)(_QWORD, double);
  void *v9;
  float v10;
  float v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  if (v8)
  {
    v12 = v11;
    if ((v8[2](v8, v12) & 1) == 0)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      v14 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%@: invalid value for %@: %@"), v14, v19, v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      *a5 = 1;
    }
  }

}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_6(uint64_t a1, void *a2, char a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  BOOL v18;
  id v19;

  v19 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 && (a3 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_opt_class();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler."), v19, v11, objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v15 = a1 + 56;
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 24) = 0;
    *a5 = 1;
    goto LABEL_10;
  }
  v16 = *(_QWORD *)(a1 + 56);
  v15 = a1 + 56;
  v17 = *(unsigned __int8 *)(*(_QWORD *)(v16 + 8) + 24);
  if (v8)
    v18 = v17 == 0;
  else
    v18 = 1;
  if (!v18 && (objc_msgSend(v8, "validate") & 1) == 0)
    goto LABEL_9;
LABEL_10:

}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_7(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  BOOL v20;
  id v21;

  v21 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 && (a3 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x24BDD17C8];
    v13 = objc_opt_class();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler."), v21, v13, objc_opt_class());
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v17 = a1 + 56;
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v17 + 8) + 24) = 0;
    *a7 = 1;
    goto LABEL_10;
  }
  v18 = *(_QWORD *)(a1 + 56);
  v17 = a1 + 56;
  v19 = *(unsigned __int8 *)(*(_QWORD *)(v18 + 8) + 24);
  if (v10)
    v20 = v19 == 0;
  else
    v20 = 1;
  if (!v20 && (objc_msgSend(v10, "validate") & 1) == 0)
    goto LABEL_9;
LABEL_10:

}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_8(uint64_t a1, void *a2, char a3, uint64_t a4, _BYTE *a5)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 && (a3 & 1) == 0)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    v11 = objc_opt_class();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Property '%@' is not set on %@. This property must not be nil when passing %@ to the complication data handler."), v17, v11, objc_opt_class());
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v15 = a1 + 56;
LABEL_9:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)v15 + 8) + 24) = 0;
    *a5 = 1;
    goto LABEL_10;
  }
  v15 = a1 + 56;
  if (v8)
    v16 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0;
  else
    v16 = 1;
  if (!v16 && (objc_msgSend(v8, "validateWithError:", *(_QWORD *)(a1 + 64)) & 1) == 0)
    goto LABEL_9;
LABEL_10:

}

void __45__CLKComplicationTemplate_validateWithError___block_invoke_9(uint64_t a1, void *a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, _BYTE *a10, uint64_t a11, uint64_t a12, uint64_t a13, __int128 a14, uint64_t a15, uint64_t a16)
{
  void *v22;
  void *v23;
  uint64_t v24;
  objc_class *v25;
  id v26;
  uint64_t v27;
  void *v28;
  int v29;
  NSObject *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v37;
  _QWORD v38[5];
  __int128 v39;
  uint64_t v40;
  void *v41;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v37 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "_validateSwiftUIViewForKey:withMaxSDKSize:maxDeviceSize:cornerRadius:safeAreaInsets:error:", a3, a4, a5, a6, a7, a14, a15, a16) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a10 = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (!ComplicationDisplayLibraryCore_frameworkLibrary)
    {
      v39 = xmmword_24CBF9CE0;
      v40 = 0;
      ComplicationDisplayLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (ComplicationDisplayLibraryCore_frameworkLibrary
      && ((objc_msgSend(*(id *)(a1 + 32), "renderForPreviews") & 1) != 0 || CLKIsBeingDebugged()))
    {
      objc_msgSend(*(id *)(a1 + 32), "viewDataForSwiftUIViewKey:", v37);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
LABEL_24:

        goto LABEL_25;
      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v44 = 0x2050000000;
      v23 = (void *)get_ClientRendererClass_softClass;
      v45 = get_ClientRendererClass_softClass;
      v24 = MEMORY[0x24BDAC760];
      if (!get_ClientRendererClass_softClass)
      {
        *(_QWORD *)&v39 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v39 + 1) = 3221225472;
        v40 = (uint64_t)__get_ClientRendererClass_block_invoke;
        v41 = &unk_24CBF9D00;
        p_buf = &buf;
        __get_ClientRendererClass_block_invoke((uint64_t)&v39);
        v23 = *(void **)(*((_QWORD *)&buf + 1) + 24);
      }
      v25 = objc_retainAutorelease(v23);
      _Block_object_dispose(&buf, 8);
      v26 = objc_alloc_init(v25);
      *(_QWORD *)&v39 = 0;
      *((_QWORD *)&v39 + 1) = &v39;
      v40 = 0x2020000000;
      v41 = 0;
      v27 = 5;
      do
      {
        +[CLKDevice currentDevice](CLKDevice, "currentDevice");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "screenScale");
        v38[0] = v24;
        v38[1] = 3221225472;
        v38[2] = __45__CLKComplicationTemplate_validateWithError___block_invoke_10;
        v38[3] = &unk_24CBF9340;
        v38[4] = &v39;
        objc_msgSend(v26, "renderWithViewData:scale:handler:", v22, v38);

        --v27;
      }
      while (v27);
      v29 = objc_msgSend(*(id *)(a1 + 32), "hasSubMinuteUpdateRate");
      CLKLoggingObjectForDomain(1);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 24);
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v31;
        _os_log_impl(&dword_2114F4000, v30, OS_LOG_TYPE_DEFAULT, "CLKComplicationTemplate: Complication took %gs to render", (uint8_t *)&buf, 0xCu);
      }

      v32 = *(double *)(*((_QWORD *)&v39 + 1) + 24);
      if (v32 <= 0.0166666667 || v32 >= 0.0333333333)
      {
        if (v32 >= 0.0333333333)
        {
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The '%@' view on %@ took more than two frames to render. This template will be removed from the timeline."), v37, objc_opt_class());
          v33 = objc_claimAutoreleasedReturnValue();
          goto LABEL_22;
        }
      }
      else if (v29)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The '%@' view on %@ took more than one frame to render which is too long when using an auto-updating view. This template will be removed from the timeline."), v37, objc_opt_class());
        v33 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v34 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v35 = *(void **)(v34 + 40);
        *(_QWORD *)(v34 + 40) = v33;

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
        *a10 = 1;
      }
      _Block_object_dispose(&v39, 8);

      goto LABEL_24;
    }
  }
LABEL_25:

}

uint64_t __45__CLKComplicationTemplate_validateWithError___block_invoke_10(uint64_t result, double a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(double *)(v2 + 24) < a2)
    *(double *)(v2 + 24) = a2;
  return result;
}

- (BOOL)_validateSwiftUIViewForKey:(id)a3 withMaxSize:(CGSize)a4 cornerRadius:(double)a5 safeAreaInsets:(UIEdgeInsets)a6 error:(id *)a7
{
  return 1;
}

- (Class)finalizedCopyClass
{
  return 0;
}

- (id)finalizedCopy
{
  CLKComplicationTemplate *v3;

  if (self->_finalized)
  {
    v3 = self;
  }
  else
  {
    self->_finalizing = 1;
    v3 = (CLKComplicationTemplate *)-[CLKComplicationTemplate copy](self, "copy");
    -[CLKComplicationTemplate finalize](v3, "finalize");
    self->_finalizing = 0;
  }
  return v3;
}

- (BOOL)usesSwiftUI
{
  return 0;
}

- (BOOL)needsSerializableCopy
{
  return 0;
}

- (void)finalize
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (!self->_finalized)
  {
    v3 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __35__CLKComplicationTemplate_finalize__block_invoke;
    v10[3] = &unk_24CBF9390;
    v10[4] = self;
    -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v10);
    v9[0] = v3;
    v9[1] = 3221225472;
    v9[2] = __35__CLKComplicationTemplate_finalize__block_invoke_2;
    v9[3] = &unk_24CBF93B8;
    v9[4] = self;
    -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](self, "_enumerateImageProviderKeysWithBlock:", v9);
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __35__CLKComplicationTemplate_finalize__block_invoke_3;
    v8[3] = &unk_24CBF9390;
    v8[4] = self;
    -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v8);
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __35__CLKComplicationTemplate_finalize__block_invoke_4;
    v7[3] = &unk_24CBF9390;
    v7[4] = self;
    -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](self, "_enumerateGaugeProviderKeysWithBlock:", v7);
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __35__CLKComplicationTemplate_finalize__block_invoke_5;
    v6[3] = &unk_24CBF93E0;
    v6[4] = self;
    -[CLKComplicationTemplate _enumerateFullColorImageProviderKeysWithBlock:](self, "_enumerateFullColorImageProviderKeysWithBlock:", v6);
    v5[0] = v3;
    v5[1] = 3221225472;
    v5[2] = __35__CLKComplicationTemplate_finalize__block_invoke_6;
    v5[3] = &unk_24CBF9390;
    v5[4] = self;
    -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v5);
    v4[0] = v3;
    v4[1] = 3221225472;
    v4[2] = __35__CLKComplicationTemplate_finalize__block_invoke_7;
    v4[3] = &unk_24CBF9408;
    v4[4] = self;
    -[CLKComplicationTemplate _enumerateSwiftUIViewKeysWithBlock:](self, "_enumerateSwiftUIViewKeysWithBlock:", v4);
    self->_finalized = 1;
  }
}

void __35__CLKComplicationTemplate_finalize__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalize");

}

void __35__CLKComplicationTemplate_finalize__block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11)
{
  void *v19;
  id v20;

  v20 = a9;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v19, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:maskToCircle:", v20, a10, a11, a3, a4, a5, a6);
  else
    objc_msgSend(v19, "finalizeWithMaxSDKSize:maxDeviceSize:maskToCircle:", a11, a3, a4, a5, a6);

}

void __35__CLKComplicationTemplate_finalize__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalize");

}

void __35__CLKComplicationTemplate_finalize__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalize");

}

void __35__CLKComplicationTemplate_finalize__block_invoke_5(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11)
{
  void *v19;
  id v20;

  v20 = a10;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v19, "finalizeWithPointSize:weight:maxSDKSize:maxDeviceSize:cornerRadius:", v20, a11, a3, a4, a5, a6, a7);
  else
    objc_msgSend(v19, "finalizeWithMaxSDKSize:maxDeviceSize:cornerRadius:", a3, a4, a5, a6, a7);

}

void __35__CLKComplicationTemplate_finalize__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTintColor:", v5);

  }
  if (objc_msgSend(v3, "finalizedCopyClass"))
  {
    objc_msgSend(v3, "finalizedCopy");
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v6, v7);
    v3 = (void *)v6;
  }
  else
  {
    objc_msgSend(v3, "finalize");
  }

}

uint64_t __35__CLKComplicationTemplate_finalize__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeSwiftUIViewForKey:withMaxSDKSize:maxDeviceSize:cornerRadius:safeAreaInsets:", a2);
}

- (void)maxSDKSize:(CGSize *)a3 deviceSize:(CGSize *)a4 forImageProviderKey:(id)a5
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, void *, double, double, double, double, uint64_t, uint64_t, uint64_t, uint64_t, _BYTE *);
  void *v15;
  id v16;
  uint64_t *v17;
  CGSize *v18;
  CGSize *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  CGSize *v23;
  CGSize *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v9 = MEMORY[0x24BDAC760];
  v28 = 0;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __69__CLKComplicationTemplate_maxSDKSize_deviceSize_forImageProviderKey___block_invoke;
  v20[3] = &unk_24CBF9430;
  v22 = &v25;
  v10 = v8;
  v21 = v10;
  v23 = a3;
  v24 = a4;
  -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](self, "_enumerateImageProviderKeysWithBlock:", v20);
  if (!*((_BYTE *)v26 + 24))
  {
    v12 = v9;
    v13 = 3221225472;
    v14 = __69__CLKComplicationTemplate_maxSDKSize_deviceSize_forImageProviderKey___block_invoke_2;
    v15 = &unk_24CBF9458;
    v17 = &v25;
    v11 = v10;
    v16 = v11;
    v18 = a3;
    v19 = a4;
    -[CLKComplicationTemplate _enumerateFullColorImageProviderKeysWithBlock:](self, "_enumerateFullColorImageProviderKeysWithBlock:", &v12);

    if (!*((_BYTE *)v26 + 24))
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Template class %@: unknown image provider key %@"), objc_opt_class(), v11, v12, v13, v14, v15);
  }

  _Block_object_dispose(&v25, 8);
}

uint64_t __69__CLKComplicationTemplate_maxSDKSize_deviceSize_forImageProviderKey___block_invoke(uint64_t result, void *a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _BYTE *a12)
{
  _QWORD *v17;
  double *v18;
  double *v19;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v17 = (_QWORD *)result;
    result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(result + 32));
    if ((_DWORD)result)
    {
      v18 = (double *)v17[6];
      if (v18)
      {
        *v18 = a3;
        v18[1] = a4;
      }
      v19 = (double *)v17[7];
      if (v19)
      {
        *v19 = a5;
        v19[1] = a6;
      }
      *(_BYTE *)(*(_QWORD *)(v17[5] + 8) + 24) = 1;
      *a12 = 1;
    }
  }
  return result;
}

uint64_t __69__CLKComplicationTemplate_maxSDKSize_deviceSize_forImageProviderKey___block_invoke_2(uint64_t result, void *a2, double a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _BYTE *a11)
{
  _QWORD *v16;
  double *v17;
  double *v18;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v16 = (_QWORD *)result;
    result = objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(result + 32));
    if ((_DWORD)result)
    {
      v17 = (double *)v16[6];
      if (v17)
      {
        *v17 = a3;
        v17[1] = a4;
      }
      v18 = (double *)v16[7];
      if (v18)
      {
        *v18 = a5;
        v18[1] = a6;
      }
      *(_BYTE *)(*(_QWORD *)(v16[5] + 8) + 24) = 1;
      *a11 = 1;
    }
  }
  return result;
}

- (void)enumerateTextProviderKeysWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __62__CLKComplicationTemplate_enumerateTextProviderKeysWithBlock___block_invoke;
  v6[3] = &unk_24CBF9480;
  v7 = v4;
  v5 = v4;
  -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v6);

}

uint64_t __62__CLKComplicationTemplate_enumerateTextProviderKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateImageProviderKeysWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__CLKComplicationTemplate_enumerateImageProviderKeysWithBlock___block_invoke;
  v6[3] = &unk_24CBF94A8;
  v7 = v4;
  v5 = v4;
  -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](self, "_enumerateImageProviderKeysWithBlock:", v6);

}

uint64_t __63__CLKComplicationTemplate_enumerateImageProviderKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateProgressProviderKeysWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__CLKComplicationTemplate_enumerateProgressProviderKeysWithBlock___block_invoke;
  v6[3] = &unk_24CBF9480;
  v7 = v4;
  v5 = v4;
  -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v6);

}

uint64_t __66__CLKComplicationTemplate_enumerateProgressProviderKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateEmbeddedTemplateKeysWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__CLKComplicationTemplate_enumerateEmbeddedTemplateKeysWithBlock___block_invoke;
  v6[3] = &unk_24CBF9480;
  v7 = v4;
  v5 = v4;
  -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v6);

}

uint64_t __66__CLKComplicationTemplate_enumerateEmbeddedTemplateKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateSwiftUIViewDataKeysWithBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__CLKComplicationTemplate_enumerateSwiftUIViewDataKeysWithBlock___block_invoke;
  v6[3] = &unk_24CBF9480;
  v7 = v4;
  v5 = v4;
  -[CLKComplicationTemplate _enumerateSwiftUIViewDataKeysWithBlock:](self, "_enumerateSwiftUIViewDataKeysWithBlock:", v6);

}

uint64_t __65__CLKComplicationTemplate_enumerateSwiftUIViewDataKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  id v19;
  void **v20;
  BOOL v21;
  _QWORD v23[5];
  void **v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[5];
  id v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  _QWORD v44[5];
  id v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  _QWORD v58[5];
  id v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  _QWORD v65[5];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  char v71;
  _QWORD v72[5];
  id v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  _QWORD v79[5];
  id v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  char v85;
  _QWORD v86[5];
  id v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  char v92;
  _QWORD v93[5];
  id v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  char v99;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (v5 = objc_msgSend(v4, "uiSensitivity"), v5 == -[CLKComplicationTemplate uiSensitivity](self, "uiSensitivity")))
  {
    v96 = 0;
    v97 = &v96;
    v98 = 0x2020000000;
    v6 = MEMORY[0x24BDAC760];
    v99 = 1;
    v93[0] = MEMORY[0x24BDAC760];
    v93[1] = 3221225472;
    v93[2] = __35__CLKComplicationTemplate_isEqual___block_invoke;
    v93[3] = &unk_24CBF94D0;
    v93[4] = self;
    v7 = v4;
    v94 = v7;
    v95 = &v96;
    -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v93);
    if (*((_BYTE *)v97 + 24))
    {
      v89 = 0;
      v90 = &v89;
      v91 = 0x2020000000;
      v92 = 1;
      v86[0] = v6;
      v86[1] = 3221225472;
      v86[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_2;
      v86[3] = &unk_24CBF94F8;
      v86[4] = self;
      v8 = v7;
      v87 = v8;
      v88 = &v89;
      -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](self, "_enumerateImageProviderKeysWithBlock:", v86);
      if (*((_BYTE *)v90 + 24))
      {
        v82 = 0;
        v83 = &v82;
        v84 = 0x2020000000;
        v85 = 1;
        v79[0] = v6;
        v79[1] = 3221225472;
        v79[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_3;
        v79[3] = &unk_24CBF94D0;
        v79[4] = self;
        v9 = v8;
        v80 = v9;
        v81 = &v82;
        -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v79);
        if (*((_BYTE *)v83 + 24))
        {
          v75 = 0;
          v76 = &v75;
          v77 = 0x2020000000;
          v78 = 1;
          v72[0] = v6;
          v72[1] = 3221225472;
          v72[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_4;
          v72[3] = &unk_24CBF9520;
          v72[4] = self;
          v10 = v9;
          v73 = v10;
          v74 = &v75;
          -[CLKComplicationTemplate _enumerateIntegerKeysWithBlock:](self, "_enumerateIntegerKeysWithBlock:", v72);
          if (*((_BYTE *)v76 + 24))
          {
            v68 = 0;
            v69 = &v68;
            v70 = 0x2020000000;
            v71 = 1;
            v65[0] = v6;
            v65[1] = 3221225472;
            v65[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_5;
            v65[3] = &unk_24CBF9548;
            v65[4] = self;
            v11 = v10;
            v66 = v11;
            v67 = &v68;
            -[CLKComplicationTemplate _enumerateFloatKeysWithBlock:](self, "_enumerateFloatKeysWithBlock:", v65);
            if (*((_BYTE *)v69 + 24))
            {
              v61 = 0;
              v62 = &v61;
              v63 = 0x2020000000;
              v64 = 1;
              v58[0] = v6;
              v58[1] = 3221225472;
              v58[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_6;
              v58[3] = &unk_24CBF9570;
              v58[4] = self;
              v12 = v11;
              v59 = v12;
              v60 = &v61;
              -[CLKComplicationTemplate _enumerateBOOLKeysWithBlock:](self, "_enumerateBOOLKeysWithBlock:", v58);
              if (*((_BYTE *)v62 + 24))
              {
                v54 = 0;
                v55 = &v54;
                v56 = 0x2020000000;
                v57 = 1;
                v51[0] = v6;
                v51[1] = 3221225472;
                v51[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_7;
                v51[3] = &unk_24CBF9570;
                v51[4] = self;
                v13 = v12;
                v52 = v13;
                v53 = &v54;
                -[CLKComplicationTemplate _enumerateDateKeysWithBlock:](self, "_enumerateDateKeysWithBlock:", v51);
                if (*((_BYTE *)v55 + 24)
                  && (-[CLKComplicationTemplate tintColor](self, "tintColor"),
                      v14 = (void *)objc_claimAutoreleasedReturnValue(),
                      objc_msgSend(v13, "tintColor"),
                      v15 = (void *)objc_claimAutoreleasedReturnValue(),
                      v16 = CLKEqualObjects(v14, v15),
                      v15,
                      v14,
                      v16))
                {
                  v47 = 0;
                  v48 = &v47;
                  v49 = 0x2020000000;
                  v50 = 1;
                  v44[0] = v6;
                  v44[1] = 3221225472;
                  v44[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_8;
                  v44[3] = &unk_24CBF94D0;
                  v44[4] = self;
                  v17 = v13;
                  v45 = v17;
                  v46 = &v47;
                  -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](self, "_enumerateGaugeProviderKeysWithBlock:", v44);
                  if (*((_BYTE *)v48 + 24))
                  {
                    v40 = 0;
                    v41 = &v40;
                    v42 = 0x2020000000;
                    v43 = 1;
                    v37[0] = v6;
                    v37[1] = 3221225472;
                    v37[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_9;
                    v37[3] = &unk_24CBF9598;
                    v37[4] = self;
                    v18 = v17;
                    v38 = v18;
                    v39 = &v40;
                    -[CLKComplicationTemplate _enumerateFullColorImageProviderKeysWithBlock:](self, "_enumerateFullColorImageProviderKeysWithBlock:", v37);
                    if (*((_BYTE *)v41 + 24))
                    {
                      v33 = 0;
                      v34 = &v33;
                      v35 = 0x2020000000;
                      v36 = 1;
                      v30[0] = v6;
                      v30[1] = 3221225472;
                      v30[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_10;
                      v30[3] = &unk_24CBF94D0;
                      v30[4] = self;
                      v19 = v18;
                      v31 = v19;
                      v32 = &v33;
                      -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v30);
                      if (*((_BYTE *)v34 + 24))
                      {
                        v26 = 0;
                        v27 = &v26;
                        v28 = 0x2020000000;
                        v29 = 1;
                        v23[0] = v6;
                        v23[1] = 3221225472;
                        v23[2] = __35__CLKComplicationTemplate_isEqual___block_invoke_11;
                        v23[3] = &unk_24CBF94D0;
                        v23[4] = self;
                        v20 = (void **)v19;
                        v24 = v20;
                        v25 = &v26;
                        -[CLKComplicationTemplate _enumerateSwiftUIViewDataKeysWithBlock:](self, "_enumerateSwiftUIViewDataKeysWithBlock:", v23);
                        v21 = *((_BYTE *)v27 + 24)
                           && CLKEqualObjects(self->_metadata, v20[1])
                           && self->_linkedOnOrAfterGrace == *((unsigned __int8 *)v20 + 26)
                           && self->_sdkVersion == (_QWORD)v20[5];

                        _Block_object_dispose(&v26, 8);
                      }
                      else
                      {
                        v21 = 0;
                      }

                      _Block_object_dispose(&v33, 8);
                    }
                    else
                    {
                      v21 = 0;
                    }

                    _Block_object_dispose(&v40, 8);
                  }
                  else
                  {
                    v21 = 0;
                  }

                  _Block_object_dispose(&v47, 8);
                }
                else
                {
                  v21 = 0;
                }

                _Block_object_dispose(&v54, 8);
              }
              else
              {
                v21 = 0;
              }

              _Block_object_dispose(&v61, 8);
            }
            else
            {
              v21 = 0;
            }

            _Block_object_dispose(&v68, 8);
          }
          else
          {
            v21 = 0;
          }

          _Block_object_dispose(&v75, 8);
        }
        else
        {
          v21 = 0;
        }

        _Block_object_dispose(&v82, 8);
      }
      else
      {
        v21 = 0;
      }

      _Block_object_dispose(&v89, 8);
    }
    else
    {
      v21 = 0;
    }

    _Block_object_dispose(&v96, 8);
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void __35__CLKComplicationTemplate_isEqual___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _BYTE *a8)
{
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = *(void **)(a1 + 32);
  v11 = a2;
  objc_msgSend(v10, "valueForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = CLKEqualObjects(v12, v13);
  if ((v11 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a8 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "integerValue");
  if (v10 != v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  float v13;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "floatValue");
  LOBYTE(v8) = CLKFloatEqualsFloat(v11, v13);

  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v10, "BOOLValue");
  if (v9 != (_DWORD)v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_7(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = CLKEqualObjects(v8, v9);
  if ((v7 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_9(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v9 = *(void **)(a1 + 32);
  v10 = a2;
  objc_msgSend(v9, "valueForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = CLKEqualObjects(v11, v12);
  if ((v10 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a7 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

void __35__CLKComplicationTemplate_isEqual___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "valueForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = CLKEqualObjects(v9, v10);
  if ((v8 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a5 = 1;
  }
}

- (unint64_t)hash
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v3 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __31__CLKComplicationTemplate_hash__block_invoke;
  v22[3] = &unk_24CBF95C0;
  v22[4] = self;
  v22[5] = &v23;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __31__CLKComplicationTemplate_hash__block_invoke_2;
  v20[3] = &unk_24CBF95E8;
  v4 = (id)MEMORY[0x212BDBEAC](v22, a2);
  v21 = v4;
  -[CLKComplicationTemplate _enumerateAllBasicKeysWithBlock:](self, "_enumerateAllBasicKeysWithBlock:", v20);
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __31__CLKComplicationTemplate_hash__block_invoke_3;
  v18[3] = &unk_24CBF9480;
  v5 = v4;
  v19 = v5;
  -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v18);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __31__CLKComplicationTemplate_hash__block_invoke_4;
  v16[3] = &unk_24CBF9480;
  v6 = v5;
  v17 = v6;
  -[CLKComplicationTemplate _enumerateSwiftUIViewDataKeysWithBlock:](self, "_enumerateSwiftUIViewDataKeysWithBlock:", v16);
  -[CLKComplicationTemplate tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = objc_msgSend(CFSTR("tintColor"), "hash");
  v24[3] += v9 * v8;

  v10 = -[NSDictionary hash](self->_metadata, "hash");
  v11 = v24;
  v12 = v24[3] + v10 + self->_linkedOnOrAfterGrace;
  v24[3] = v12;
  v13 = v12 + self->_sdkVersion;
  v11[3] = v13;
  if (self->_uiSensitivity)
    v14 = v13 + 1;
  else
    v14 = v13;
  v11[3] = v14;

  _Block_object_dispose(&v23, 8);
  return v14;
}

void __31__CLKComplicationTemplate_hash__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v7, "hash");
  v6 = objc_msgSend(v4, "hash");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v6 * v5;
}

uint64_t __31__CLKComplicationTemplate_hash__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__CLKComplicationTemplate_hash__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __31__CLKComplicationTemplate_hash__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_class *v5;
  objc_class *v6;
  uint64_t v7;
  objc_class *v8;
  id *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id *v13;
  _QWORD v15[4];
  id *v16;
  CLKComplicationTemplate *v17;
  _QWORD v18[4];
  objc_class *v19;
  CLKComplicationTemplate *v20;

  if (self->_finalized)
    return self;
  if (!self->_finalizing || (v5 = -[CLKComplicationTemplate finalizedCopyClass](self, "finalizedCopyClass")) == 0)
    v5 = (objc_class *)objc_opt_class();
  v6 = -[objc_class init](-[objc_class allocWithZone:](v5, "allocWithZone:", a3), "init");
  v7 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __40__CLKComplicationTemplate_copyWithZone___block_invoke;
  v18[3] = &unk_24CBF9610;
  v8 = v6;
  v19 = v8;
  v20 = self;
  -[CLKComplicationTemplate _enumerateAllBasicKeysWithBlock:](self, "_enumerateAllBasicKeysWithBlock:", v18);
  v15[0] = v7;
  v15[1] = 3221225472;
  v15[2] = __40__CLKComplicationTemplate_copyWithZone___block_invoke_2;
  v15[3] = &unk_24CBF9638;
  v9 = v8;
  v16 = v9;
  v17 = self;
  -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v15);
  -[CLKComplicationTemplate tintColor](self, "tintColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTintColor:", v10);

  v11 = -[NSDictionary mutableCopy](self->_metadata, "mutableCopy");
  v12 = v9[1];
  v9[1] = (id)v11;

  *((_BYTE *)v9 + 26) = self->_linkedOnOrAfterGrace;
  v9[5] = (id)self->_sdkVersion;
  objc_storeStrong(v9 + 7, self->_creationDate);
  v9[6] = (id)self->_uiSensitivity;
  objc_storeStrong(v9 + 8, self->_backgroundDescriptor);
  -[CLKComplicationTemplate _setCustomCopyPropertiesOn:finalizing:](self, "_setCustomCopyPropertiesOn:finalizing:", v9, self->_finalizing);
  v13 = v9;

  return v13;
}

void __40__CLKComplicationTemplate_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValue:forKey:", v5, v4);

}

void __40__CLKComplicationTemplate_copyWithZone___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v2, "setValue:forKey:", v5, v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  CLKComplicationTemplate *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[5];
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  _QWORD v49[5];
  id v50;

  v4 = a3;
  v5 = (void *)MEMORY[0x212BDBCF0]();
  v6 = MEMORY[0x24BDAC760];
  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke;
  v49[3] = &unk_24CBF9638;
  v49[4] = self;
  v7 = v4;
  v50 = v7;
  -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v49);

  objc_autoreleasePoolPop(v5);
  v8 = (void *)MEMORY[0x212BDBCF0]();
  v47[0] = v6;
  v47[1] = 3221225472;
  v47[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_2;
  v47[3] = &unk_24CBF9660;
  v47[4] = self;
  v9 = v7;
  v48 = v9;
  -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](self, "_enumerateImageProviderKeysWithBlock:", v47);

  objc_autoreleasePoolPop(v8);
  v10 = (void *)MEMORY[0x212BDBCF0]();
  v45[0] = v6;
  v45[1] = 3221225472;
  v45[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_3;
  v45[3] = &unk_24CBF9638;
  v45[4] = self;
  v11 = v9;
  v46 = v11;
  -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v45);

  objc_autoreleasePoolPop(v10);
  v43[0] = v6;
  v43[1] = 3221225472;
  v43[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_4;
  v43[3] = &unk_24CBF9688;
  v43[4] = self;
  v12 = v11;
  v44 = v12;
  -[CLKComplicationTemplate _enumerateIntegerKeysWithBlock:](self, "_enumerateIntegerKeysWithBlock:", v43);
  v41[0] = v6;
  v41[1] = 3221225472;
  v41[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_5;
  v41[3] = &unk_24CBF96B0;
  v41[4] = self;
  v13 = v12;
  v42 = v13;
  -[CLKComplicationTemplate _enumerateFloatKeysWithBlock:](self, "_enumerateFloatKeysWithBlock:", v41);
  v39[0] = v6;
  v39[1] = 3221225472;
  v39[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_6;
  v39[3] = &unk_24CBF96D8;
  v39[4] = self;
  v14 = v13;
  v40 = v14;
  -[CLKComplicationTemplate _enumerateBOOLKeysWithBlock:](self, "_enumerateBOOLKeysWithBlock:", v39);
  v37[0] = v6;
  v37[1] = 3221225472;
  v37[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_7;
  v37[3] = &unk_24CBF96D8;
  v37[4] = self;
  v15 = v14;
  v38 = v15;
  -[CLKComplicationTemplate _enumerateDateKeysWithBlock:](self, "_enumerateDateKeysWithBlock:", v37);
  -[CLKComplicationTemplate tintColor](self, "tintColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v16, CFSTR("tintColor"));

  v17 = (void *)MEMORY[0x212BDBCF0]();
  v35[0] = v6;
  v35[1] = 3221225472;
  v35[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_8;
  v35[3] = &unk_24CBF9638;
  v35[4] = self;
  v18 = v15;
  v36 = v18;
  -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](self, "_enumerateGaugeProviderKeysWithBlock:", v35);

  objc_autoreleasePoolPop(v17);
  v19 = (void *)MEMORY[0x212BDBCF0]();
  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_9;
  v33[3] = &unk_24CBF9700;
  v33[4] = self;
  v20 = v18;
  v34 = v20;
  -[CLKComplicationTemplate _enumerateFullColorImageProviderKeysWithBlock:](self, "_enumerateFullColorImageProviderKeysWithBlock:", v33);

  objc_autoreleasePoolPop(v19);
  v21 = (void *)MEMORY[0x212BDBCF0]();
  v31[0] = v6;
  v31[1] = 3221225472;
  v31[2] = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_10;
  v31[3] = &unk_24CBF9638;
  v31[4] = self;
  v22 = v20;
  v32 = v22;
  -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v31);

  objc_autoreleasePoolPop(v21);
  v23 = (void *)MEMORY[0x212BDBCF0]();
  v25 = v6;
  v26 = 3221225472;
  v27 = __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_84;
  v28 = &unk_24CBF9638;
  v29 = self;
  v24 = v22;
  v30 = v24;
  -[CLKComplicationTemplate _enumerateSwiftUIViewDataKeysWithBlock:](self, "_enumerateSwiftUIViewDataKeysWithBlock:", &v25);

  objc_autoreleasePoolPop(v23);
  objc_msgSend(v24, "encodeObject:forKey:", self->_metadata, CFSTR("metadata"), v25, v26, v27, v28, v29);
  objc_msgSend(v24, "encodeBool:forKey:", self->_linkedOnOrAfterGrace, CFSTR("linkedOnOrAfterGrace"));
  objc_msgSend(v24, "encodeInteger:forKey:", self->_sdkVersion, CFSTR("sdkVersion"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(v24, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(v24, "encodeBool:forKey:", self->_finalized, CFSTR("finalized"));
  objc_msgSend(v24, "encodeInteger:forKey:", self->_uiSensitivity, CFSTR("sensitivity"));

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, v4);

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, v4);

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, v4);

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "valueForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(*(id *)(a1 + 40), "encodeInteger:forKey:", v5, v6);
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  double v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "valueForKey:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  LODWORD(v7) = v6;
  objc_msgSend(*(id *)(a1 + 40), "encodeFloat:forKey:", v8, v7);

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v3, "valueForKey:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(*(id *)(a1 + 40), "encodeBool:forKey:", v5, v6);
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, v4);

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, v4);

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, v4);

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v4, v3);
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v6, CFSTR("BezelCircularClassName"));

  }
  else
  {
    CLKLoggingObjectForDomain(1);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_10_cold_1((uint64_t)v4, v7);

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Property '%@' on %@ must be a valid subclass of CLKComplicationTemplate"), v3, objc_opt_class());
  }

}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_84(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "valueForKey:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "encodeObject:forKey:", v5, v4);

}

- (CLKComplicationTemplate)initWithCoder:(id)a3
{
  id v4;
  CLKComplicationTemplate *v5;
  void *v6;
  uint64_t v7;
  id v8;
  CLKComplicationTemplate *v9;
  void *v10;
  id v11;
  CLKComplicationTemplate *v12;
  void *v13;
  id v14;
  CLKComplicationTemplate *v15;
  id v16;
  CLKComplicationTemplate *v17;
  id v18;
  CLKComplicationTemplate *v19;
  id v20;
  CLKComplicationTemplate *v21;
  id v22;
  CLKComplicationTemplate *v23;
  void *v24;
  void *v25;
  id v26;
  CLKComplicationTemplate *v27;
  void *v28;
  id v29;
  CLKComplicationTemplate *v30;
  void *v31;
  id v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, void *);
  void *v50;
  id v51;
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  CLKComplicationTemplate *v61;
  _QWORD v62[4];
  id v63;
  CLKComplicationTemplate *v64;
  _QWORD v65[4];
  id v66;
  CLKComplicationTemplate *v67;
  _QWORD v68[4];
  id v69;
  CLKComplicationTemplate *v70;
  _QWORD v71[4];
  id v72;
  CLKComplicationTemplate *v73;
  _QWORD v74[4];
  id v75;
  CLKComplicationTemplate *v76;
  _QWORD v77[4];
  id v78;
  CLKComplicationTemplate *v79;
  _QWORD v80[4];
  id v81;
  CLKComplicationTemplate *v82;

  v4 = a3;
  v5 = -[CLKComplicationTemplate initPrivate](self, "initPrivate");
  if (v5)
  {
    v6 = (void *)MEMORY[0x212BDBCF0]();
    v7 = MEMORY[0x24BDAC760];
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke;
    v80[3] = &unk_24CBF9638;
    v8 = v4;
    v81 = v8;
    v9 = v5;
    v82 = v9;
    -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](v9, "_enumerateTextProviderKeysWithBlock:", v80);

    objc_autoreleasePoolPop(v6);
    v10 = (void *)MEMORY[0x212BDBCF0]();
    v77[0] = v7;
    v77[1] = 3221225472;
    v77[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_2;
    v77[3] = &unk_24CBF9660;
    v11 = v8;
    v78 = v11;
    v12 = v9;
    v79 = v12;
    -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](v12, "_enumerateImageProviderKeysWithBlock:", v77);

    objc_autoreleasePoolPop(v10);
    v13 = (void *)MEMORY[0x212BDBCF0]();
    v74[0] = v7;
    v74[1] = 3221225472;
    v74[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_3;
    v74[3] = &unk_24CBF9638;
    v14 = v11;
    v75 = v14;
    v15 = v12;
    v76 = v15;
    -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](v15, "_enumerateProgressProviderKeysWithBlock:", v74);

    objc_autoreleasePoolPop(v13);
    v71[0] = v7;
    v71[1] = 3221225472;
    v71[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_4;
    v71[3] = &unk_24CBF9688;
    v16 = v14;
    v72 = v16;
    v17 = v15;
    v73 = v17;
    -[CLKComplicationTemplate _enumerateIntegerKeysWithBlock:](v17, "_enumerateIntegerKeysWithBlock:", v71);
    v68[0] = v7;
    v68[1] = 3221225472;
    v68[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_5;
    v68[3] = &unk_24CBF96B0;
    v18 = v16;
    v69 = v18;
    v19 = v17;
    v70 = v19;
    -[CLKComplicationTemplate _enumerateFloatKeysWithBlock:](v19, "_enumerateFloatKeysWithBlock:", v68);
    v65[0] = v7;
    v65[1] = 3221225472;
    v65[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_6;
    v65[3] = &unk_24CBF96D8;
    v20 = v18;
    v66 = v20;
    v21 = v19;
    v67 = v21;
    -[CLKComplicationTemplate _enumerateBOOLKeysWithBlock:](v21, "_enumerateBOOLKeysWithBlock:", v65);
    v62[0] = v7;
    v62[1] = 3221225472;
    v62[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_7;
    v62[3] = &unk_24CBF96D8;
    v22 = v20;
    v63 = v22;
    v23 = v21;
    v64 = v23;
    -[CLKComplicationTemplate _enumerateDateKeysWithBlock:](v23, "_enumerateDateKeysWithBlock:", v62);
    objc_msgSend(v22, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tintColor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKComplicationTemplate setTintColor:](v23, "setTintColor:", v24);

    v25 = (void *)MEMORY[0x212BDBCF0]();
    v59[0] = v7;
    v59[1] = 3221225472;
    v59[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_8;
    v59[3] = &unk_24CBF9638;
    v26 = v22;
    v60 = v26;
    v27 = v23;
    v61 = v27;
    -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](v27, "_enumerateGaugeProviderKeysWithBlock:", v59);

    objc_autoreleasePoolPop(v25);
    v28 = (void *)MEMORY[0x212BDBCF0]();
    v56[0] = v7;
    v56[1] = 3221225472;
    v56[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_9;
    v56[3] = &unk_24CBF9700;
    v29 = v26;
    v57 = v29;
    v30 = v27;
    v58 = v30;
    objc_msgSend(v30, "_enumerateFullColorImageProviderKeysWithBlock:", v56);

    objc_autoreleasePoolPop(v28);
    v31 = (void *)MEMORY[0x212BDBCF0]();
    v53[0] = v7;
    v53[1] = 3221225472;
    v53[2] = __41__CLKComplicationTemplate_initWithCoder___block_invoke_10;
    v53[3] = &unk_24CBF9638;
    v32 = v29;
    v54 = v32;
    v33 = v30;
    v55 = v33;
    objc_msgSend(v33, "_enumerateEmbeddedTemplateKeysWithBlock:", v53);

    objc_autoreleasePoolPop(v31);
    v34 = (void *)MEMORY[0x212BDBCF0]();
    objc_msgSend((id)objc_opt_class(), "classesCompatibleWithJSONSerialization");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "decodeObjectOfClasses:forKey:", v35, CFSTR("metadata"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = objc_msgSend(v36, "copy");
      v38 = (void *)v33[1];
      v33[1] = v37;

    }
    objc_autoreleasePoolPop(v34);
    v39 = (void *)MEMORY[0x212BDBCF0]();
    v47 = v7;
    v48 = 3221225472;
    v49 = __41__CLKComplicationTemplate_initWithCoder___block_invoke_92;
    v50 = &unk_24CBF9638;
    v40 = v32;
    v51 = v40;
    v41 = v33;
    v52 = v41;
    objc_msgSend(v41, "_enumerateSwiftUIViewDataKeysWithBlock:", &v47);

    objc_autoreleasePoolPop(v39);
    *((_BYTE *)v41 + 26) = objc_msgSend(v40, "decodeBoolForKey:", CFSTR("linkedOnOrAfterGrace"), v47, v48, v49, v50);
    v41[5] = objc_msgSend(v40, "decodeIntegerForKey:", CFSTR("sdkVersion"));
    objc_msgSend(v40, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v42)
    {
      v44 = v42;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v44 = (id)objc_claimAutoreleasedReturnValue();
    }
    v45 = (void *)v41[7];
    v41[7] = v44;

    *((_BYTE *)v41 + 24) = objc_msgSend(v40, "decodeBoolForKey:", CFSTR("finalized"));
    v41[6] = objc_msgSend(v40, "decodeIntegerForKey:", CFSTR("sensitivity"));

  }
  return v5;
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", v4);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  float v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeFloatForKey:", v4);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "decodeBoolForKey:", v4);
  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_9(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v4);

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSString *v4;
  void *v5;
  int v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BezelCircularClassName"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "_validEmbeddedTemplateClassNamesForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "decodeObjectOfClass:forKey:", NSClassFromString(v4), v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v7, v3);

    }
    else
    {
      CLKLoggingObjectForDomain(1);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __41__CLKComplicationTemplate_initWithCoder___block_invoke_10_cold_1();

    }
  }

}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_92(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v5, v4);

}

+ (CLKComplicationTemplate)complicationTemplateWithJSONObjectRepresentation:(id)a3 bundle:(id)a4 purpose:(unint64_t)a5
{
  id v8;
  NSString *v9;
  Class v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  id v54;
  unint64_t v55;
  void *v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  id v67;
  unint64_t v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  _QWORD v77[4];
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD v83[4];
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  _QWORD v93[4];
  id v94;
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v57 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("top level object must be a dictionary. Invalid value: %@"), v8);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("class"));
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = NSClassFromString(v9);
    if ((-[objc_class isSubclassOfClass:](v10, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("class: %@ must be a CLKComplicationTemplate class"), v9);
    v58 = (id)objc_msgSend([v10 alloc], "initPrivateWithJSONObjectRepresentation:bundle:", v8, v57);
    if (v58)
    {
      v11 = MEMORY[0x24BDAC760];
      v93[0] = MEMORY[0x24BDAC760];
      v93[1] = 3221225472;
      v93[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke;
      v93[3] = &unk_24CBF9638;
      v12 = v8;
      v94 = v12;
      v13 = v58;
      v95 = v13;
      objc_msgSend(v13, "_enumerateTextProviderKeysWithBlock:", v93);
      v89[0] = v11;
      v89[1] = 3221225472;
      v89[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_2;
      v89[3] = &unk_24CBF9728;
      v14 = v12;
      v90 = v14;
      v15 = v57;
      v91 = v15;
      v16 = v13;
      v92 = v16;
      objc_msgSend(v16, "_enumerateImageProviderKeysWithBlock:", v89);
      v86[0] = v11;
      v86[1] = 3221225472;
      v86[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_3;
      v86[3] = &unk_24CBF96D8;
      v17 = v14;
      v87 = v17;
      v18 = v16;
      v88 = v18;
      objc_msgSend(v18, "_enumerateBOOLKeysWithBlock:", v86);
      v83[0] = v11;
      v83[1] = 3221225472;
      v83[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_4;
      v83[3] = &unk_24CBF96B0;
      v19 = v17;
      v84 = v19;
      v20 = v18;
      v85 = v20;
      objc_msgSend(v20, "_enumerateFloatKeysWithBlock:", v83);
      v80[0] = v11;
      v80[1] = 3221225472;
      v80[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_5;
      v80[3] = &unk_24CBF9688;
      v21 = v19;
      v81 = v21;
      v22 = v20;
      v82 = v22;
      objc_msgSend(v22, "_enumerateIntegerKeysWithBlock:", v80);
      v77[0] = v11;
      v77[1] = 3221225472;
      v77[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_6;
      v77[3] = &unk_24CBF96D8;
      v23 = v21;
      v78 = v23;
      v24 = v22;
      v79 = v24;
      objc_msgSend(v24, "_enumerateDateKeysWithBlock:", v77);
      v54 = a1;
      v55 = a5;
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("tintColor"));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD4B8]), "initWithJSONObjectRepresentation:", v56);
        objc_msgSend(v24, "setTintColor:", v25);

      }
      v73[0] = v11;
      v73[1] = 3221225472;
      v73[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_7;
      v73[3] = &unk_24CBF9750;
      v26 = v23;
      v74 = v26;
      v27 = v15;
      v75 = v27;
      v28 = v24;
      v76 = v28;
      objc_msgSend(v28, "_enumerateGaugeProviderKeysWithBlock:", v73);
      v69[0] = v11;
      v69[1] = 3221225472;
      v69[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_8;
      v69[3] = &unk_24CBF9778;
      v29 = v26;
      v70 = v29;
      v30 = v27;
      v71 = v30;
      v31 = v28;
      v72 = v31;
      objc_msgSend(v31, "_enumerateFullColorImageProviderKeysWithBlock:", v69);
      v63[0] = v11;
      v63[1] = 3221225472;
      v63[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_9;
      v63[3] = &unk_24CBF97A0;
      v32 = v29;
      v64 = v32;
      v67 = v54;
      v33 = v30;
      v65 = v33;
      v68 = v55;
      v34 = v31;
      v66 = v34;
      objc_msgSend(v34, "_enumerateEmbeddedTemplateKeysWithBlock:", v63);
      v59[0] = v11;
      v59[1] = 3221225472;
      v59[2] = __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_10;
      v59[3] = &unk_24CBF9750;
      v35 = v32;
      v60 = v35;
      v36 = v33;
      v61 = v36;
      v37 = v34;
      v62 = v37;
      objc_msgSend(v37, "_enumerateSwiftUIViewDataKeysWithBlock:", v59);
      v38 = v37;
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("creationDate"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v40 = v39;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v40 = (id)objc_claimAutoreleasedReturnValue();
      }
      v41 = (void *)*((_QWORD *)v37 + 7);
      *((_QWORD *)v37 + 7) = v40;

      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("sdkVersion"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        *((_QWORD *)v37 + 5) = objc_msgSend(v42, "integerValue");
      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("metadata"));
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = (void *)v43;
      if (v55)
      {
        if (v43)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("%@' must be a dictionary. Invalid value: %@"), CFSTR("metadata"), v44);
        }
        v45 = objc_alloc_init(MEMORY[0x24BDBCE70]);
        v46 = (void *)objc_opt_class();
        objc_msgSend(v36, "bundlePath");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "_secureCodingRepresentationOfEmbeddedObjectsDictionary:bundlePath:", v44, v47);
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("_createDecodableComplicationJsonDictionary has failed and the metadataDictionary is no longer a dictionary, %@"), v44);
        v49 = objc_msgSend(v48, "copy");
        v50 = (void *)v38[1];
        v38[1] = v49;
      }
      else
      {
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("sensitivity"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          *((_QWORD *)v37 + 6) = objc_msgSend(v48, "integerValue");
        objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("linkedOnOrAfterGrace"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          *((_BYTE *)v37 + 26) = objc_msgSend(v50, "BOOLValue");
        v51 = objc_msgSend(v44, "copy");
        v52 = (void *)*((_QWORD *)v37 + 1);
        *((_QWORD *)v37 + 1) = v51;

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("'%@' must be a string. Invalid value: %@"), CFSTR("class"), v9);

    v58 = 0;
  }

  return (CLKComplicationTemplate *)v58;
}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a2;
  if (a4)
  {
    v11 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!a3 || v8)
    {
      +[CLKTextProvider providerWithJSONObjectRepresentation:](CLKTextProvider, "providerWithJSONObjectRepresentation:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v10, v11);

    }
    v7 = v11;
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_2(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v9 = a5;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (!a3 || v10)
    {
      +[CLKImageProvider imageProviderWithJSONObjectRepresentation:bundle:](CLKImageProvider, "imageProviderWithJSONObjectRepresentation:bundle:", v10, *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v12, v13);

    }
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_3(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  if (a3)
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), v7, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key in '%@' dictionary was not provided - invalid value: %@"), v7, *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v6, v7);

    v5 = v7;
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_4(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  if (a3)
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), v7, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key in '%@' dictionary was not provided - invalid value: %@"), v7, *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v6, v7);

    v5 = v7;
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_5(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  if (a3)
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("value for key '%@' must be a number - invalid value: %@"), v7, v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key in '%@' dictionary was not provided - invalid value: %@"), v7, *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v6, v7);

    v5 = v7;
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_6(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a2;
  if (a3)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE60]), "initWithJSONObjectRepresentation:", v6);
      objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v7, v8);

    }
    v5 = v8;
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_7(uint64_t a1, void *a2, int a3, int a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a2;
  if (a4)
  {
    v11 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!a3 || v8)
    {
      +[CLKGaugeProvider providerWithJSONObjectRepresentation:bundle:](CLKGaugeProvider, "providerWithJSONObjectRepresentation:bundle:", v8, *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v10, v11);

    }
    v7 = v11;
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_8(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v9 = a5;
  if (a4)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (!a3 || v10)
    {
      +[CLKFullColorImageProvider fullColorImageProviderWithJSONObjectRepresentation:bundle:](CLKFullColorImageProvider, "fullColorImageProviderWithJSONObjectRepresentation:bundle:", v10, *(_QWORD *)(a1 + 40));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v12, v13);

    }
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_9(uint64_t a1, void *a2, int a3, int a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = a2;
  if (a4)
  {
    v14 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!a3 || v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("BezelCircularClassName"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (!a3 || v10)
      {
        objc_msgSend((id)objc_opt_class(), "complicationTemplateWithJSONObjectRepresentation:bundle:purpose:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if ((a3 & 1) == 0 && !v12)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("CLKComplicationBundleException"), CFSTR("key '%@': required embedded template is nil"), v14);
        objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v13, v14);

      }
    }

    v7 = v14;
  }

}

void __91__CLKComplicationTemplate_complicationTemplateWithJSONObjectRepresentation_bundle_purpose___block_invoke_10(uint64_t a1, void *a2, int a3, int a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a2;
  if (a4)
  {
    v11 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!a3 || v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithJSONObjectRepresentation:bundle:", v8, *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 48), "setValue:forKey:", v10, v11);

    }
    v7 = v11;
  }

}

- (id)JSONObjectRepresentationWritingResourcesToBundlePath:(id)a3 purpose:(unint64_t)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  _QWORD v43[4];
  id v44;
  CLKComplicationTemplate *v45;
  _QWORD v46[4];
  id v47;
  CLKComplicationTemplate *v48;
  _QWORD v49[4];
  id v50;
  CLKComplicationTemplate *v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  unint64_t v62;
  _QWORD v63[5];
  id v64;
  id v65;
  _QWORD v66[5];
  id v67;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("class"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_24CC16D80, CFSTR("version"));
  -[UIColor JSONObjectRepresentation](self->_tintColor, "JSONObjectRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("tintColor"));

  v11 = MEMORY[0x24BDAC760];
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke;
  v66[3] = &unk_24CBF9638;
  v66[4] = self;
  v12 = v7;
  v67 = v12;
  -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](self, "_enumerateGaugeProviderKeysWithBlock:", v66);
  v63[0] = v11;
  v63[1] = 3221225472;
  v63[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_2;
  v63[3] = &unk_24CBF9778;
  v63[4] = self;
  v13 = v6;
  v64 = v13;
  v14 = v12;
  v65 = v14;
  -[CLKComplicationTemplate _enumerateFullColorImageProviderKeysWithBlock:](self, "_enumerateFullColorImageProviderKeysWithBlock:", v63);
  v59[0] = v11;
  v59[1] = 3221225472;
  v59[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_3;
  v59[3] = &unk_24CBF97C8;
  v59[4] = self;
  v15 = v13;
  v60 = v15;
  v62 = a4;
  v16 = v14;
  v61 = v16;
  -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v59);
  v17 = (void *)MEMORY[0x24BDD16E0];
  -[NSDate timeIntervalSince1970](self->_creationDate, "timeIntervalSince1970");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("creationDate"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sdkVersion);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("sdkVersion"));

  if (!a4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_linkedOnOrAfterGrace);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("linkedOnOrAfterGrace"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_uiSensitivity);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("sensitivity"));

    v20 = (void *)-[NSDictionary copy](self->_metadata, "copy");
    goto LABEL_5;
  }
  objc_msgSend((id)objc_opt_class(), "createJSONRepresentationFromDictionary:bundlePath:purpose:", self->_metadata, v15, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
LABEL_5:
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("metadata"));

  v57[0] = v11;
  v57[1] = 3221225472;
  v57[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_4;
  v57[3] = &unk_24CBF9638;
  v57[4] = self;
  v23 = v16;
  v58 = v23;
  -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v57);
  v54[0] = v11;
  v54[1] = 3221225472;
  v54[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_5;
  v54[3] = &unk_24CBF9728;
  v54[4] = self;
  v24 = v15;
  v55 = v24;
  v25 = v23;
  v56 = v25;
  -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](self, "_enumerateImageProviderKeysWithBlock:", v54);
  v52[0] = v11;
  v52[1] = 3221225472;
  v52[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_6;
  v52[3] = &unk_24CBF9638;
  v52[4] = self;
  v26 = v25;
  v53 = v26;
  -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v52);
  v49[0] = v11;
  v49[1] = 3221225472;
  v49[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_7;
  v49[3] = &unk_24CBF96D8;
  v27 = v26;
  v50 = v27;
  v51 = self;
  -[CLKComplicationTemplate _enumerateBOOLKeysWithBlock:](self, "_enumerateBOOLKeysWithBlock:", v49);
  v46[0] = v11;
  v46[1] = 3221225472;
  v46[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_8;
  v46[3] = &unk_24CBF96B0;
  v28 = v27;
  v47 = v28;
  v48 = self;
  -[CLKComplicationTemplate _enumerateFloatKeysWithBlock:](self, "_enumerateFloatKeysWithBlock:", v46);
  v43[0] = v11;
  v43[1] = 3221225472;
  v43[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_9;
  v43[3] = &unk_24CBF9688;
  v29 = v28;
  v44 = v29;
  v45 = self;
  -[CLKComplicationTemplate _enumerateIntegerKeysWithBlock:](self, "_enumerateIntegerKeysWithBlock:", v43);
  v41[0] = v11;
  v41[1] = 3221225472;
  v41[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_10;
  v41[3] = &unk_24CBF96D8;
  v41[4] = self;
  v30 = v29;
  v42 = v30;
  -[CLKComplicationTemplate _enumerateDateKeysWithBlock:](self, "_enumerateDateKeysWithBlock:", v41);
  v38[0] = v11;
  v38[1] = 3221225472;
  v38[2] = __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_11;
  v38[3] = &unk_24CBF9750;
  v38[4] = self;
  v31 = v24;
  v39 = v31;
  v32 = v30;
  v40 = v32;
  -[CLKComplicationTemplate _enumerateSwiftUIViewDataKeysWithBlock:](self, "_enumerateSwiftUIViewDataKeysWithBlock:", v38);
  if (a4 == 1)
  {
    objc_msgSend((id)objc_opt_class(), "createJSONRepresentationFromDictionary:bundlePath:purpose:", v32, v31, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "mutableCopy");

    v32 = (id)v34;
  }
  v35 = v40;
  v36 = v32;

  return v36;
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "valueForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "JSONObjectRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "valueForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "JSONObjectRepresentationWritingResourcesToBundlePath:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v6);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "valueForKey:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "JSONObjectRepresentationWritingResourcesToBundlePath:purpose:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v6);

    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, CFSTR("BezelCircularClassName"));

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "valueForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "JSONObjectRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "valueForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "JSONObjectRepresentationWritingResourcesToBundlePath:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v6);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "valueForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "JSONObjectRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v6);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_7(uint64_t a1, void *a2, int a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = a2;
    objc_msgSend(v4, "valueForKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_8(uint64_t a1, void *a2, int a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = a2;
    objc_msgSend(v4, "valueForKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_9(uint64_t a1, void *a2, int a3)
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = *(void **)(a1 + 40);
    v5 = a2;
    objc_msgSend(v4, "valueForKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_10(uint64_t a1, void *a2, int a3)
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a2;
    objc_msgSend(v4, "valueForKey:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "JSONObjectRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v5);

  }
}

void __88__CLKComplicationTemplate_JSONObjectRepresentationWritingResourcesToBundlePath_purpose___block_invoke_11(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  if (a4)
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "valueForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "JSONObjectRepresentationWritingResourcesToBundlePath:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v7, v6);

  }
}

+ (id)_secureCodingRepresentationOfEmbeddedObjectsDictionary:(id)a3 bundlePath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", v7);
  if (v9)
  {
    objc_msgSend(v6, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", CFSTR("class"));

    if (v11)
    {
      objc_msgSend((id)objc_opt_class(), "objectFromJSON:bundle:", v6, v9);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = v9;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v6, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
            objc_msgSend(v6, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_secureCodingRepresentationOfValue:bundlePath:", v19, v7);
            v20 = objc_claimAutoreleasedReturnValue();
            if (!v20)
            {

              v12 = 0;
              goto LABEL_17;
            }
            v21 = (void *)v20;
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v18);

          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v15)
            continue;
          break;
        }
      }

      v12 = v8;
LABEL_17:
      v9 = v23;
    }
  }
  else
  {
    CLKLoggingObjectForDomain(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[CLKComplicationTemplate _secureCodingRepresentationOfEmbeddedObjectsDictionary:bundlePath:].cold.1();

    v12 = 0;
  }

  return v12;
}

+ (id)_secureCodingRepresentationOfEmbeddedObjectsArray:(id)a3 bundlePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1488]), "initWithPath:", v7);
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(a1, "_secureCodingRepresentationOfValue:bundlePath:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v7, (_QWORD)v19);
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
          {

            goto LABEL_14;
          }
          v16 = (void *)v15;
          -[NSObject addObject:](v9, "addObject:", v15);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v12)
          continue;
        break;
      }
    }

    v9 = v9;
    v17 = v9;
  }
  else
  {
    CLKLoggingObjectForDomain(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CLKComplicationTemplate _secureCodingRepresentationOfEmbeddedObjectsDictionary:bundlePath:].cold.1();
LABEL_14:
    v17 = 0;
  }

  return v17;
}

+ (id)_secureCodingRepresentationOfValue:(id)a3 bundlePath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_class();
  if (objc_msgSend(v8, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend((id)objc_opt_class(), "_secureCodingRepresentationOfEmbeddedObjectsDictionary:bundlePath:", v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = v9;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(a1, "_secureCodingRepresentationOfEmbeddedObjectsArray:bundlePath:", v6, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (objc_msgSend((id)objc_opt_class(), "classIsCompatibleWithJSONSerialization:", v8))
  {
    v9 = v6;
    goto LABEL_7;
  }
  CLKLoggingObjectForDomain(0);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    +[CLKComplicationTemplate _secureCodingRepresentationOfValue:bundlePath:].cold.1((objc_class *)v8, v12);

  v10 = 0;
LABEL_8:

  return v10;
}

- (id)_validEmbeddedTemplateClassNamesForKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set", a3);
}

- (void)_setProvidersPaused:(BOOL)a3
{
  uint64_t v5;
  _QWORD v6[5];
  BOOL v7;
  _QWORD v8[5];
  BOOL v9;
  _QWORD v10[5];
  BOOL v11;
  _QWORD v12[5];
  BOOL v13;

  v5 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __47__CLKComplicationTemplate__setProvidersPaused___block_invoke;
  v12[3] = &unk_24CBF97F0;
  v12[4] = self;
  v13 = a3;
  -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v12);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_2;
  v10[3] = &unk_24CBF97F0;
  v10[4] = self;
  v11 = a3;
  -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_3;
  v8[3] = &unk_24CBF97F0;
  v8[4] = self;
  v9 = a3;
  -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](self, "_enumerateGaugeProviderKeysWithBlock:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_4;
  v6[3] = &unk_24CBF97F0;
  v6[4] = self;
  v7 = a3;
  -[CLKComplicationTemplate _enumerateEmbeddedTemplateKeysWithBlock:](self, "_enumerateEmbeddedTemplateKeysWithBlock:", v6);
}

void __47__CLKComplicationTemplate__setProvidersPaused___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaused:", *(unsigned __int8 *)(a1 + 40));

}

void __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaused:", *(unsigned __int8 *)(a1 + 40));

}

void __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPaused:", *(unsigned __int8 *)(a1 + 40));

}

void __47__CLKComplicationTemplate__setProvidersPaused___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setProvidersPaused:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_enumerateScalarKeysWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke;
  v13[3] = &unk_24CBF9818;
  v6 = v4;
  v14 = v6;
  -[CLKComplicationTemplate _enumerateIntegerKeysWithBlock:](self, "_enumerateIntegerKeysWithBlock:", v13);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke_2;
  v11[3] = &unk_24CBF9840;
  v7 = v6;
  v12 = v7;
  -[CLKComplicationTemplate _enumerateFloatKeysWithBlock:](self, "_enumerateFloatKeysWithBlock:", v11);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke_3;
  v9[3] = &unk_24CBF9868;
  v10 = v7;
  v8 = v7;
  -[CLKComplicationTemplate _enumerateBOOLKeysWithBlock:](self, "_enumerateBOOLKeysWithBlock:", v9);

}

uint64_t __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57__CLKComplicationTemplate__enumerateScalarKeysWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_enumerateAllBasicKeysWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke;
  v25[3] = &unk_24CBF9480;
  v6 = v4;
  v26 = v6;
  -[CLKComplicationTemplate _enumerateTextProviderKeysWithBlock:](self, "_enumerateTextProviderKeysWithBlock:", v25);
  v23[0] = v5;
  v23[1] = 3221225472;
  v23[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_2;
  v23[3] = &unk_24CBF94A8;
  v7 = v6;
  v24 = v7;
  -[CLKComplicationTemplate _enumerateImageProviderKeysWithBlock:](self, "_enumerateImageProviderKeysWithBlock:", v23);
  v21[0] = v5;
  v21[1] = 3221225472;
  v21[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_3;
  v21[3] = &unk_24CBF9480;
  v8 = v7;
  v22 = v8;
  -[CLKComplicationTemplate _enumerateProgressProviderKeysWithBlock:](self, "_enumerateProgressProviderKeysWithBlock:", v21);
  v19[0] = v5;
  v19[1] = 3221225472;
  v19[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_4;
  v19[3] = &unk_24CBF95E8;
  v9 = v8;
  v20 = v9;
  -[CLKComplicationTemplate _enumerateScalarKeysWithBlock:](self, "_enumerateScalarKeysWithBlock:", v19);
  v17[0] = v5;
  v17[1] = 3221225472;
  v17[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_5;
  v17[3] = &unk_24CBF9868;
  v10 = v9;
  v18 = v10;
  -[CLKComplicationTemplate _enumerateDateKeysWithBlock:](self, "_enumerateDateKeysWithBlock:", v17);
  v15[0] = v5;
  v15[1] = 3221225472;
  v15[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_6;
  v15[3] = &unk_24CBF9480;
  v11 = v10;
  v16 = v11;
  -[CLKComplicationTemplate _enumerateGaugeProviderKeysWithBlock:](self, "_enumerateGaugeProviderKeysWithBlock:", v15);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_7;
  v13[3] = &unk_24CBF9890;
  v14 = v11;
  v12 = v11;
  -[CLKComplicationTemplate _enumerateFullColorImageProviderKeysWithBlock:](self, "_enumerateFullColorImageProviderKeysWithBlock:", v13);

}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __59__CLKComplicationTemplate__enumerateAllBasicKeysWithBlock___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(UIColor *)tintColor
{
  objc_setProperty_nonatomic_copy(self, a2, tintColor, 32);
}

- (BOOL)isLinkedOnOrAfterGrace
{
  return self->_linkedOnOrAfterGrace;
}

- (BOOL)renderForPreviews
{
  return self->_renderForPreviews;
}

- (void)setRenderForPreviews:(BOOL)a3
{
  self->_renderForPreviews = a3;
}

- (int64_t)sdkVersion
{
  return self->_sdkVersion;
}

- (BOOL)finalized
{
  return self->_finalized;
}

- (int64_t)uiSensitivity
{
  return self->_uiSensitivity;
}

- (void)setUISensitivity:(int64_t)a3
{
  self->_uiSensitivity = a3;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (CLKComplicationBackgroundDescriptor)backgroundDescriptor
{
  return self->_backgroundDescriptor;
}

- (void)setBackgroundDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundDescriptor, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_activeClients, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

+ (id)classesCompatibleWithJSONSerialization
{
  if (classesCompatibleWithJSONSerialization_classSetNTKOnceToken != -1)
    dispatch_once(&classesCompatibleWithJSONSerialization_classSetNTKOnceToken, &__block_literal_global_24);
  return (id)classesCompatibleWithJSONSerialization_classesCompatibleWithJSONSerialization;
}

void __84__CLKComplicationTemplate_JSONSerialization__classesCompatibleWithJSONSerialization__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v13 = (void *)MEMORY[0x24BDBCF20];
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)classesCompatibleWithJSONSerialization_classesCompatibleWithJSONSerialization;
  classesCompatibleWithJSONSerialization_classesCompatibleWithJSONSerialization = v10;

}

+ (id)createJSONRepresentationFromDictionary:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v23 = a4;
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v8;
  objc_msgSend(v8, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_jsonRepresentationFromValue:bundlePath:purpose:", v16, v23, a5);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          CLKLoggingObjectForDomain(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            +[CLKComplicationTemplate(JSONSerialization) createJSONRepresentationFromDictionary:bundlePath:purpose:].cold.1();

          v19 = 0;
          goto LABEL_13;
        }
        v18 = (void *)v17;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v15);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v12)
        continue;
      break;
    }
  }

  v19 = v9;
LABEL_13:

  return v19;
}

+ (id)objectFromJSON:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSString *v9;
  objc_class *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v20;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", CFSTR("class"));

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("class"));
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = NSClassFromString(v9);

    if (!v10)
    {
      CLKLoggingObjectForDomain(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[CLKComplicationTemplate(JSONSerialization) objectFromJSON:bundle:].cold.3(v11, v12, v13);

    }
    v14 = objc_msgSend((id)objc_opt_class(), "_superClassFromCompatibleJSONSerializationClass:", v10);
    if (v14)
    {
      v15 = (void *)v14;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = objc_msgSend([v10 alloc], "initWithJSONObjectRepresentation:", v5);
LABEL_19:
        v18 = (void *)v16;
        goto LABEL_20;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v16 = objc_msgSend([v10 alloc], "initWithJSONObjectRepresentation:bundle:", v5, v6);
        goto LABEL_19;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v15, "providerWithJSONObjectRepresentation:", v5);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v15, "providerWithJSONObjectRepresentation:bundle:", v5, v6);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      CLKLoggingObjectForDomain(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[CLKComplicationTemplate(JSONSerialization) objectFromJSON:bundle:].cold.2(v5, (uint64_t)CFSTR("class"));

    }
    else
    {
      CLKLoggingObjectForDomain(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[CLKComplicationTemplate(JSONSerialization) objectFromJSON:bundle:].cold.1();

    }
  }
  v18 = 0;
LABEL_20:

  return v18;
}

+ (BOOL)classIsCompatibleWithJSONSerialization:(Class)a3
{
  return objc_msgSend(a1, "_superClassFromCompatibleJSONSerializationClass:", a3) != 0;
}

+ (BOOL)dictionaryIsCompatibleWithJSONSerialization:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v4, "_arrayIsCompatibleWithJSONSerialization:", v5);
  return (char)v4;
}

+ (BOOL)_arrayIsCompatibleWithJSONSerialization:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        v10 = (void *)objc_opt_class();
        if (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class(), (_QWORD)v13))
        {
          if ((objc_msgSend(a1, "dictionaryIsCompatibleWithJSONSerialization:", v9) & 1) == 0)
            goto LABEL_16;
        }
        else if (objc_msgSend(v10, "isSubclassOfClass:", objc_opt_class()))
        {
          if ((objc_msgSend(a1, "_arrayIsCompatibleWithJSONSerialization:", v9) & 1) == 0)
            goto LABEL_16;
        }
        else if (!objc_msgSend(a1, "classIsCompatibleWithJSONSerialization:", v10))
        {
LABEL_16:
          v11 = 0;
          goto LABEL_17;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_17:

  return v11;
}

+ (id)_createJSONRepresentationFromArray:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(a1, "_jsonRepresentationFromValue:bundlePath:purpose:", v16, v9, a5, (_QWORD)v22);
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          CLKLoggingObjectForDomain(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            +[CLKComplicationTemplate(JSONSerialization) createJSONRepresentationFromDictionary:bundlePath:purpose:].cold.1();

          v19 = 0;
          goto LABEL_13;
        }
        v18 = (void *)v17;
        objc_msgSend(v10, "addObject:", v16);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
        continue;
      break;
    }
  }

  v19 = v10;
LABEL_13:

  return v19;
}

+ (id)_jsonObjectRepresentationFromObject:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
LABEL_8:
    v12 = 0;
    goto LABEL_15;
  }
  v9 = (void *)objc_opt_class();
  if (!objc_msgSend(v9, "classIsCompatibleWithJSONSerialization:", objc_opt_class()))
  {
    CLKLoggingObjectForDomain(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CLKComplicationTemplate(JSONSerialization) _jsonObjectRepresentationFromObject:bundlePath:purpose:].cold.1();

    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "JSONObjectRepresentation");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "JSONObjectRepresentationWritingResourcesToBundlePath:", v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "JSONObjectRepresentationWritingResourcesToBundlePath:purpose:", v8, a5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v7;
  }
  v12 = v10;
LABEL_15:

  return v12;
}

+ (id)_jsonRepresentationFromValue:(id)a3 bundlePath:(id)a4 purpose:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "createJSONRepresentationFromDictionary:bundlePath:purpose:", v8, v9, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1, "_createJSONRepresentationFromArray:bundlePath:purpose:", v8, v9, a5);
    else
      objc_msgSend(a1, "_jsonObjectRepresentationFromObject:bundlePath:purpose:", v8, v9, a5);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

+ (Class)_superClassFromCompatibleJSONSerializationClass:(Class)a3
{
  Class v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a1, "classesCompatibleWithJSONSerialization", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((-[objc_class isSubclassOfClass:](v3, "isSubclassOfClass:", v9) & 1) != 0)
          {
            v3 = v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    v3 = 0;
LABEL_12:

  }
  return v3;
}

- (int64_t)compatibleFamily
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)validateWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_2114F4000, a2, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __43__CLKComplicationTemplate_encodeWithCoder___block_invoke_10_cold_1(uint64_t a1, NSObject *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  OUTLINED_FUNCTION_2_0();
  v4 = v3;
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a2, v5, "Invalid embedded template class (%@)", v6);

  OUTLINED_FUNCTION_2();
}

void __41__CLKComplicationTemplate_initWithCoder___block_invoke_10_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, v0, v1, "Invalid embedded template class (%@)", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)complicationTemplateWithJSONObjectRepresentation:(void *)a1 bundle:(uint64_t)a2 purpose:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a3, (uint64_t)a3, "Complication bundle: %@", (uint8_t *)a2);

}

+ (void)_secureCodingRepresentationOfEmbeddedObjectsDictionary:bundlePath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, v0, v1, "Cannot create bundle from given path: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_secureCodingRepresentationOfValue:(objc_class *)a1 bundlePath:(NSObject *)a2 .cold.1(objc_class *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  NSStringFromClass(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_2114F4000, a2, v4, "Cannot encode class: %@ since it is not a supported type", v5);

  OUTLINED_FUNCTION_2();
}

@end
