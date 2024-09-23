@implementation CAMPhotoFormatStatusIndicator

- (CAMPhotoFormatStatusIndicator)initWithFrame:(CGRect)a3
{
  CAMPhotoFormatStatusIndicator *v3;
  CAMPhotoFormatStatusIndicator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPhotoFormatStatusIndicator;
  v3 = -[CAMExpandingControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAMPhotoFormatStatusIndicator setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("PhotoFormatStatusIndicator"));
  return v4;
}

+ (id)localizedTitleForFormat:(id)a3
{
  int64_t var1;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  var1 = a3.var1;
  if (a3.var0 > 2uLL)
  {
    v4 = 0;
  }
  else
  {
    CAMLocalizedFrameworkString(off_1EA32DD88[a3.var0], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  switch(var1)
  {
    case 0:
      goto LABEL_8;
    case 1:
      var1 = 12;
      goto LABEL_8;
    case 2:
      var1 = 24;
LABEL_8:
      +[CAMControlStatusIndicator integerFormatter](CAMControlStatusIndicator, "integerFormatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", var1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromNumber:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 3:
      CAMLocalizedFrameworkString(CFSTR("PHOTO_RESOLUTION_MAX"), 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  CAMLocalizedFrameworkString(CFSTR("PHOTO_ENCODING_PLUS_RESOLUTION_FORMAT"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v8, CFSTR("%@%@"), 0, v4, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setAllowedFormats:(id)a3 essentialFormatIndex:(unint64_t)a4 advancedFormatIndex:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  CAMExpandingControlMenuItemConfiguration *v13;
  id v14;
  CAMExpandingControlMenuItemConfiguration *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  CAMPhotoFormatStatusIndicator *v20;
  CAMExpandingControlMenuItemConfiguration *v21;
  id v22;
  unint64_t v23;
  $B1CBF1B9C19084F159A2126E2D211268 v24;

  v9 = a3;
  if (!objc_msgSend(v9, "isEqualToArray:", self->_allowedFormats)
    || self->__essentialFormatIndex != a4
    || self->__advancedFormatIndex != a5)
  {
    objc_storeStrong((id *)&self->_allowedFormats, a3);
    self->__essentialFormatIndex = a4;
    self->__advancedFormatIndex = a5;
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = ($B1CBF1B9C19084F159A2126E2D211268)0;
    objc_msgSend(v10, "getValue:size:", &v24, 16);
    self->_essentialFormat = v24;

    objc_msgSend(v9, "objectAtIndexedSubscript:", a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = ($B1CBF1B9C19084F159A2126E2D211268)0;
    objc_msgSend(v11, "getValue:size:", &v24, 16);
    self->_advancedFormat = v24;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(CAMExpandingControlMenuItemConfiguration);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __92__CAMPhotoFormatStatusIndicator_setAllowedFormats_essentialFormatIndex_advancedFormatIndex___block_invoke;
    v19 = &unk_1EA32DD68;
    v20 = self;
    v21 = v13;
    v22 = v12;
    v23 = a4;
    v14 = v12;
    v15 = v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v16);
    -[CAMExpandingControl setMenu:](self, "setMenu:", v14, v16, v17, v18, v19, v20);

  }
}

void __92__CAMPhotoFormatStatusIndicator_setAllowedFormats_essentialFormatIndex_advancedFormatIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a1 + 56);
  v6 = a2;
  v7 = (void *)objc_opt_class();
  v8 = v7;
  if (v5 == a3)
  {
    objc_msgSend(v7, "localizedTitleForFormat:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 656), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 664));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
    v10 = *(void **)(a1 + 40);
    v11 = 1;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    objc_msgSend(v6, "getValue:size:", &v13, 16);
    objc_msgSend(v8, "localizedTitleForFormat:", v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 0);
    v10 = *(void **)(a1 + 40);
    v11 = 0;
  }
  objc_msgSend(v10, "setSlashesTitle:", v11);
  +[CAMExpandingControlTextMenuItem menuItemWithState:titleText:subtitle:selectedSubtitle:configuration:](CAMExpandingControlTextMenuItem, "menuItemWithState:titleText:subtitle:selectedSubtitle:configuration:", v6, v9, v9, 0, *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "addObject:", v12);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)photoFormat
{
  void *v2;
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  -[CAMExpandingControl selectedState](self, "selectedState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 0;
  objc_msgSend(v2, "getValue:size:", &v7, 16);
  v3 = v7;
  v4 = v8;

  v5 = v3;
  v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)setPhotoFormat:(id)a3
{
  -[CAMPhotoFormatStatusIndicator setPhotoFormat:animated:](self, "setPhotoFormat:animated:", a3.var0, a3.var1, 0);
}

- (void)setPhotoFormat:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  $0AC6E346AE4835514AAA8AC86D8F4844 v7;

  v4 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", &v7, "{?=qq}");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExpandingControl setSelectedState:animated:](self, "setSelectedState:animated:", v6, v4);

}

- (int64_t)resolution
{
  int64_t v2;

  -[CAMPhotoFormatStatusIndicator photoFormat](self, "photoFormat");
  return v2;
}

- (NSArray)allowedFormats
{
  return self->_allowedFormats;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)essentialFormat
{
  $B1CBF1B9C19084F159A2126E2D211268 *p_essentialFormat;
  int64_t encoding;
  int64_t resolution;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_essentialFormat = &self->_essentialFormat;
  encoding = self->_essentialFormat.encoding;
  resolution = p_essentialFormat->resolution;
  result.var1 = resolution;
  result.var0 = encoding;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)advancedFormat
{
  $B1CBF1B9C19084F159A2126E2D211268 *p_advancedFormat;
  int64_t encoding;
  int64_t resolution;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_advancedFormat = &self->_advancedFormat;
  encoding = self->_advancedFormat.encoding;
  resolution = p_advancedFormat->resolution;
  result.var1 = resolution;
  result.var0 = encoding;
  return result;
}

- (unint64_t)_advancedFormatIndex
{
  return self->__advancedFormatIndex;
}

- (void)_setAdvancedFormatIndex:(unint64_t)a3
{
  self->__advancedFormatIndex = a3;
}

- (unint64_t)_essentialFormatIndex
{
  return self->__essentialFormatIndex;
}

- (void)_setEssentialFormatIndex:(unint64_t)a3
{
  self->__essentialFormatIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedFormats, 0);
}

@end
