@implementation CLKComplicationTemplateGraphicCornerMeteredGaugeText

- (int64_t)compatibleFamily
{
  return 8;
}

- (void)_enumerateTextProviderKeysWithBlock:(id)a3
{
  void (**v3)(id, const __CFString *, uint64_t, uint64_t, _BYTE *);
  char v4;

  v3 = (void (**)(id, const __CFString *, uint64_t, uint64_t, _BYTE *))a3;
  v4 = 0;
  v3[2](v3, CFSTR("leadingTextProvider"), 1, 1, &v4);
  if (!v4)
  {
    v3[2](v3, CFSTR("trailingTextProvider"), 1, 1, &v4);
    if (!v4)
      v3[2](v3, CFSTR("outerTextProvider"), 0, 1, &v4);
  }

}

- (void)_enumerateGaugeProviderKeysWithBlock:(id)a3
{
  char v3;

  v3 = 0;
  (*((void (**)(id, const __CFString *, _QWORD, uint64_t, char *))a3 + 2))(a3, CFSTR("gaugeProvider"), 0, 1, &v3);
}

- (void)_enumerateFullColorImageProviderKeysWithBlock:(id)a3
{
  void (**v4)(id, const __CFString *, uint64_t, uint64_t, void *, uint64_t, _BYTE *, double, double, double, double, double);
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  void *v16;
  char v17;

  v4 = (void (**)(id, const __CFString *, uint64_t, uint64_t, void *, uint64_t, _BYTE *, double, double, double, double, double))a3;
  +[CLKRenderingContext sharedRenderingContext](CLKRenderingContext, "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_908);
  WeakRetained = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_909);
  if (!WeakRetained)
    goto LABEL_5;
  v8 = WeakRetained;
  v9 = objc_loadWeakRetained(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_909);
  if (v6 != v9)
  {

LABEL_5:
    v12 = objc_storeWeak(&_enumerateFullColorImageProviderKeysWithBlock____cachedDevice_909, v6);
    _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_910 = objc_msgSend(v6, "version");

    __102__CLKComplicationTemplateGraphicCornerMeteredGaugeText__enumerateFullColorImageProviderKeysWithBlock___block_invoke(v13, (uint64_t)v6);
    goto LABEL_6;
  }
  v10 = objc_msgSend(v6, "version");
  v11 = _enumerateFullColorImageProviderKeysWithBlock____previousCLKDeviceVersion_910;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_enumerateFullColorImageProviderKeysWithBlock____lock_908);
  v14 = *(double *)&qword_254AB8598;
  v15 = *(double *)&_enumerateFullColorImageProviderKeysWithBlock___imageDiameter_906[-[CLKComplicationTemplate sdkVersion](self, "sdkVersion")];
  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)&_enumerateFullColorImageProviderKeysWithBlock___pointSize_907);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, CFSTR("outerImageProvider"), 1, 1, v16, 4, &v17, v15, v15, v14, v14, 0.0);

}

void __102__CLKComplicationTemplateGraphicCornerMeteredGaugeText__enumerateFullColorImageProviderKeysWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  +[CLKDeviceMetrics metricsWithDevice:identitySizeClass:](CLKDeviceMetrics, "metricsWithDevice:identitySizeClass:", a2, 2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scaledValue:", 16.0);
  _enumerateFullColorImageProviderKeysWithBlock___pointSize_907 = v2;
  objc_msgSend(v5, "scaledValue:", 20.0);
  qword_254AB8598 = v3;
  objc_msgSend(v5, "setNewestAllowedSizeClass:", &unk_24CC16DB0);
  objc_msgSend(v5, "scaledValue:", 20.0);
  _enumerateFullColorImageProviderKeysWithBlock___imageDiameter_906 = v4;

}

- (CLKGaugeProvider)gaugeProvider
{
  return self->_gaugeProvider;
}

- (void)setGaugeProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CLKTextProvider)leadingTextProvider
{
  return self->_leadingTextProvider;
}

- (void)setLeadingTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (CLKTextProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (void)setTrailingTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CLKTextProvider)outerTextProvider
{
  return self->_outerTextProvider;
}

- (void)setOuterTextProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (CLKFullColorImageProvider)outerImageProvider
{
  return self->_outerImageProvider;
}

- (void)setOuterImageProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerImageProvider, 0);
  objc_storeStrong((id *)&self->_outerTextProvider, 0);
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingTextProvider, 0);
  objc_storeStrong((id *)&self->_gaugeProvider, 0);
}

@end
