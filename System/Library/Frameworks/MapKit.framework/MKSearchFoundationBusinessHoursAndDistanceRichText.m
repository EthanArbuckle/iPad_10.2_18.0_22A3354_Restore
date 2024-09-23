@implementation MKSearchFoundationBusinessHoursAndDistanceRichText

- (void)resolveBusinessHoursByMapItem:(id)a3 lines:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MKSearchFoundationBusinessHoursAndDistanceRichText *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(25, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__MKSearchFoundationBusinessHoursAndDistanceRichText_resolveBusinessHoursByMapItem_lines___block_invoke;
  block[3] = &unk_1E20D7E80;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __90__MKSearchFoundationBusinessHoursAndDistanceRichText_resolveBusinessHoursByMapItem_lines___block_invoke(uint64_t a1)
{
  void *v2;
  _MKLocalizedHoursBuilder *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;

  v2 = (void *)MEMORY[0x18D778BE4]();
  if (objc_msgSend(*(id *)(a1 + 32), "_hasBusinessHours"))
  {
    v3 = -[_MKLocalizedHoursBuilder initWithMapItem:localizedHoursStringOptions:]([_MKLocalizedHoursBuilder alloc], "initWithMapItem:localizedHoursStringOptions:", *(_QWORD *)(a1 + 32), 1);
    -[_MKLocalizedHoursBuilder localizedOperatingHours](v3, "localizedOperatingHours");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setHoursString:", v4);

    objc_msgSend(*(id *)(a1 + 40), "hoursString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");

    if (v6)
    {
      v7 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "hoursString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v8);

      -[_MKLocalizedHoursBuilder hoursStateLabelColor](v3, "hoursStateLabelColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setHoursColor:", v9);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "_hasPriceDescription"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_priceDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "_priceDescription");
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v18 = (void *)v13;
      objc_msgSend(v12, "addObject:", v13);

      goto LABEL_12;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_priceRangeString");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_msgSend(*(id *)(a1 + 32), "_priceRangeString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      v12 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "_priceRangeString");
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
  }
LABEL_12:
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __90__MKSearchFoundationBusinessHoursAndDistanceRichText_resolveBusinessHoursByMapItem_lines___block_invoke_2;
  v20[3] = &unk_1E20D7E58;
  v19 = *(void **)(a1 + 48);
  v20[4] = *(_QWORD *)(a1 + 40);
  v21 = v19;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

  objc_autoreleasePoolPop(v2);
}

uint64_t __90__MKSearchFoundationBusinessHoursAndDistanceRichText_resolveBusinessHoursByMapItem_lines___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBusinessHoursResolved:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "updateFormattedTextForLines:", *(_QWORD *)(a1 + 40));
}

- (void)updateFormattedTextForLines:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  +[MKSearchFoundationResult styledStringFromStringArray:](MKSearchFoundationResult, "styledStringFromStringArray:", a3);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  -[MKSearchFoundationBusinessHoursAndDistanceRichText hoursString](self, "hoursString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[MKSearchFoundationBusinessHoursAndDistanceRichText hoursString](self, "hoursString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v23, "rangeOfString:", v6);
    v9 = v8;

    v10 = (void *)objc_opt_new();
    objc_msgSend(v23, "substringToIndex:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v12);

    }
    v13 = (void *)MEMORY[0x1E0D8C3D0];
    -[MKSearchFoundationBusinessHoursAndDistanceRichText hoursString](self, "hoursString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "textWithString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[MKSearchFoundationBusinessHoursAndDistanceRichText hoursColor](self, "hoursColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.949019611, 0.286274523, 0.200000003, 1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqual:", v17))
    {
      objc_msgSend(v15, "setTextColor:", 1);
    }
    else
    {
      -[MKSearchFoundationBusinessHoursAndDistanceRichText hoursColor](self, "hoursColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 1.0, 0.568627477, 0.0, 1.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "isEqual:", v19))
        v20 = 3;
      else
        v20 = 0;
      objc_msgSend(v15, "setTextColor:", v20);

    }
    objc_msgSend(v10, "addObject:", v15);
    objc_msgSend(v23, "substringFromIndex:", v7 + v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D8C3D0], "textWithString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v22);

    }
    -[MKSearchFoundationRichText setFormattedTextPieces:](self, "setFormattedTextPieces:", v10);

  }
  else
  {
    -[MKSearchFoundationRichText setText:](self, "setText:", v23);
  }

}

- (void)resolveDistanceString:(id)a3 lines:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v7, "insertObject:atIndex:", v6, 0);
  else
    objc_msgSend(v7, "addObject:", v6);

  -[MKSearchFoundationBusinessHoursAndDistanceRichText setDistanceResolved:](self, "setDistanceResolved:", 1);
  -[MKSearchFoundationBusinessHoursAndDistanceRichText updateFormattedTextForLines:](self, "updateFormattedTextForLines:", v7);

}

- (void)resolveDistanceNotFound
{
  -[MKSearchFoundationBusinessHoursAndDistanceRichText setDistanceResolved:](self, "setDistanceResolved:", 1);
  if (-[MKSearchFoundationBusinessHoursAndDistanceRichText isRichTextResolved](self, "isRichTextResolved"))
    -[MKSearchFoundationRichText setCompletionHandlers:](self, "setCompletionHandlers:", 0);
}

- (BOOL)isRichTextResolved
{
  _BOOL4 v3;

  v3 = -[MKSearchFoundationBusinessHoursAndDistanceRichText isBusinessHoursResolved](self, "isBusinessHoursResolved");
  if (v3)
    LOBYTE(v3) = -[MKSearchFoundationBusinessHoursAndDistanceRichText isDistanceResolved](self, "isDistanceResolved");
  return v3;
}

- (BOOL)isBusinessHoursResolved
{
  return self->_businessHoursResolved;
}

- (void)setBusinessHoursResolved:(BOOL)a3
{
  self->_businessHoursResolved = a3;
}

- (BOOL)isDistanceResolved
{
  return self->_distanceResolved;
}

- (void)setDistanceResolved:(BOOL)a3
{
  self->_distanceResolved = a3;
}

- (NSString)hoursString
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHoursString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (UIColor)hoursColor
{
  return (UIColor *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHoursColor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hoursColor, 0);
  objc_storeStrong((id *)&self->_hoursString, 0);
}

@end
