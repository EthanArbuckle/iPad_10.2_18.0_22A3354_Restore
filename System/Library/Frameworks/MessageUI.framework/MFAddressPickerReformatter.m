@implementation MFAddressPickerReformatter

- (void)setAddresses:(id)a3
{
  NSArray *v4;
  NSArray *addresses;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_addresses) & 1) == 0)
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    addresses = self->_addresses;
    self->_addresses = v4;

    -[MFAddressPickerReformatter _invalidateReformattedAddresses](self, "_invalidateReformattedAddresses");
  }

}

- (void)setMaximumWidth:(double)a3
{
  if (self->_maximumWidth != a3)
  {
    self->_maximumWidth = a3;
    -[MFAddressPickerReformatter _invalidateReformattedAddresses](self, "_invalidateReformattedAddresses");
  }
}

- (void)setAttributesDisabled:(BOOL)a3
{
  if (self->_attributesDisabled != a3)
  {
    self->_attributesDisabled = a3;
    -[MFAddressPickerReformatter _invalidateReformattedAddresses](self, "_invalidateReformattedAddresses");
  }
}

- (void)setFontSize:(double)a3
{
  -[MFAddressPickerReformatter setMinimumFontSize:maximumFontSize:](self, "setMinimumFontSize:maximumFontSize:", a3, a3);
}

- (void)setMinimumFontSize:(double)a3 maximumFontSize:(double)a4
{
  if (self->_minimumFontSize != a3 || self->_maximumFontSize != a4)
  {
    self->_minimumFontSize = a3;
    self->_maximumFontSize = a4;
    -[MFAddressPickerReformatter _invalidateReformattedAddresses](self, "_invalidateReformattedAddresses");
  }
}

- (unint64_t)numberOfReformattedAddresses
{
  return -[NSArray count](self->_addresses, "count");
}

- (id)reformattedAddressAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[MFAddressPickerReformatter _updateReformattedAddressesIfNecessary](self, "_updateReformattedAddressesIfNecessary");
  -[NSArray objectAtIndex:](self->_reformattedAddresses, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributedStringWithFontSize:maximumWidth:options:", -[MFAddressPickerReformatter _defaultOptions](self, "_defaultOptions"), self->_fontSize, self->_maximumWidth);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)reformattedAddressStringAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;

  -[MFAddressPickerReformatter reformattedAddressAtIndex:](self, "reformattedAddressAtIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_defaultOptions
{
  return self->_attributesDisabled;
}

- (void)_invalidateReformattedAddresses
{
  NSArray *reformattedAddresses;

  reformattedAddresses = self->_reformattedAddresses;
  self->_reformattedAddresses = 0;

}

- (void)_updateReformattedAddressesIfNecessary
{
  NSArray **p_reformattedAddresses;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  MFReformattedAddress *v9;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  p_reformattedAddresses = &self->_reformattedAddresses;
  if (!self->_reformattedAddresses)
  {
    if (self->_attributesDisabled && self->_minimumFontSize != self->_maximumFontSize)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFAddressPickerReformatter.m"), 115, CFSTR("Single font size required with attributes disabled"));

    }
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_addresses, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_addresses;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = -[MFReformattedAddress initWithAddress:]([MFReformattedAddress alloc], "initWithAddress:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          objc_msgSend(v4, "addObject:", v9);

        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    objc_storeStrong((id *)p_reformattedAddresses, v4);
    v12 = 0;
    -[MFAddressPickerReformatter _determineFontSize:](self, "_determineFontSize:", &v12);
    if (v12)
      -[MFAddressPickerReformatter _truncateIdenticalLocalPartsWithDifferentDomainParts](self, "_truncateIdenticalLocalPartsWithDifferentDomainParts");
    -[MFAddressPickerReformatter _attemptUniquingDisplayedStrings](self, "_attemptUniquingDisplayedStrings");

  }
}

- (void)_determineFontSize:(BOOL *)a3
{
  double maximumFontSize;
  double minimumFontSize;
  uint64_t v7;
  BOOL v8;
  _QWORD v9[5];

  minimumFontSize = self->_minimumFontSize;
  maximumFontSize = self->_maximumFontSize;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__MFAddressPickerReformatter__determineFontSize___block_invoke;
  v9[3] = &unk_1E5A654F0;
  v9[4] = self;
  v7 = MFLastIndexInRangePassingTest((unint64_t)(minimumFontSize + -1.0), (unint64_t)maximumFontSize, v9);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || minimumFontSize > (double)(unint64_t)v7)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    minimumFontSize = (double)(unint64_t)v7;
  }
  self->_fontSize = minimumFontSize;
  if (a3)
    *a3 = v8;
}

uint64_t __49__MFAddressPickerReformatter__determineFontSize___block_invoke(uint64_t a1, unint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  double v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "widthWithFontSize:maximumWidth:options:", objc_msgSend(*(id *)(a1 + 32), "_defaultOptions", (_QWORD)v11) | 2, (double)a2, *(double *)(*(_QWORD *)(a1 + 32) + 24));
        if (v8 > *(double *)(*(_QWORD *)(a1 + 32) + 24))
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)_truncateIdenticalLocalPartsWithDifferentDomainParts
{
  -[MFAddressPickerReformatter _truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength:options:](self, "_truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength:options:", 0, -[MFAddressPickerReformatter _defaultOptions](self, "_defaultOptions") | 1);
}

- (void)_truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength:(unint64_t)a3 options:(unint64_t)a4
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v15[7];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSArray count](self->_reformattedAddresses, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_reformattedAddresses;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "localPart");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v10);

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke;
  v15[3] = &unk_1E5A65568;
  v15[4] = self;
  v15[5] = a4;
  v15[6] = a3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);

}

void __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD v31[6];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v6;
  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v9 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke_2;
    v31[3] = &unk_1E5A65518;
    v10 = a1[5];
    v31[4] = a1[4];
    v31[5] = v10;
    objc_msgSend(v8, "mf_objectWithHighest:", v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "length");
    if (v12 - a1[6] <= 1)
      v13 = 1;
    else
      v13 = v12 - a1[6];
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke_3;
    v27[3] = &unk_1E5A65540;
    v14 = v11;
    v15 = a1[4];
    v28 = v14;
    v29 = v15;
    v30 = v13;
    v16 = MFLastIndexInRangePassingTest(2uLL, v13, v27);
    v17 = v16;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL || (v18 = v13 - v16) == 0)
    {
      objc_msgSend(v14, "setMiddleTruncationRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v19 = v8;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v24 != v21)
              objc_enumerationMutation(v19);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setMiddleTruncationRange:", v17, v18, (_QWORD)v23);
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        }
        while (v20);
      }

    }
  }

}

uint64_t __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "widthWithFontSize:maximumWidth:options:", *(_QWORD *)(a1 + 40) | 2, *(double *)(*(_QWORD *)(a1 + 32) + 48), 1.79769313e308);
}

BOOL __105__MFAddressPickerReformatter__truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength_options___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "setMiddleTruncationRange:", a2, *(_QWORD *)(a1 + 48) - a2);
  objc_msgSend(*(id *)(a1 + 32), "widthWithFontSize:maximumWidth:options:", objc_msgSend(*(id *)(a1 + 40), "_defaultOptions") | 3, *(double *)(*(_QWORD *)(a1 + 40) + 48), *(double *)(*(_QWORD *)(a1 + 40) + 24));
  return v3 <= *(double *)(*(_QWORD *)(a1 + 40) + 24);
}

- (void)_attemptUniquingDisplayedStrings
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[6];

  v3 = 1;
  v4 = MEMORY[0x1E0C809B0];
  do
  {
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __62__MFAddressPickerReformatter__attemptUniquingDisplayedStrings__block_invoke;
    v6[3] = &unk_1E5A65590;
    v6[4] = self;
    v6[5] = v3++;
  }
  while (-[MFAddressPickerReformatter _attemptUniquingDisplayedStringsUsingBlock:](self, "_attemptUniquingDisplayedStringsUsingBlock:", v6));
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __62__MFAddressPickerReformatter__attemptUniquingDisplayedStrings__block_invoke_2;
  v5[3] = &unk_1E5A65480;
  v5[4] = self;
  -[MFAddressPickerReformatter _attemptUniquingDisplayedStringsUsingBlock:](self, "_attemptUniquingDisplayedStringsUsingBlock:", v5);
}

uint64_t __62__MFAddressPickerReformatter__attemptUniquingDisplayedStrings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_truncateIdenticalLocalPartsWithDifferentDomainPartsWithTailLength:options:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_defaultOptions"));
}

uint64_t __62__MFAddressPickerReformatter__attemptUniquingDisplayedStrings__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_expandAllLocalParts");
}

- (BOOL)_attemptUniquingDisplayedStringsUsingBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v4 = (void (**)(_QWORD))a3;
  -[MFAddressPickerReformatter _reformattedAddressesByDisplayedStrings](self, "_reformattedAddressesByDisplayedStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MFAddressPickerReformatter _reformattedAddressesByDisplayedStringsAreUnique:](self, "_reformattedAddressesByDisplayedStringsAreUnique:", v5))
  {
    v6 = 0;
  }
  else
  {
    -[MFAddressPickerReformatter _saveMiddleTruncationRanges](self, "_saveMiddleTruncationRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4);
    -[MFAddressPickerReformatter _reformattedAddressesByDisplayedStrings](self, "_reformattedAddressesByDisplayedStrings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v6 = v9 > objc_msgSend(v5, "count");
    if (!v6)
      -[MFAddressPickerReformatter _restoreMiddleTruncationRanges:](self, "_restoreMiddleTruncationRanges:", v7);

  }
  return v6;
}

- (id)_reformattedAddressesByDisplayedStrings
{
  NSArray **p_reformattedAddresses;
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_reformattedAddresses = &self->_reformattedAddresses;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", -[NSArray count](self->_reformattedAddresses, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = *p_reformattedAddresses;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        objc_msgSend(v9, "attributedStringWithFontSize:maximumWidth:options:", -[MFAddressPickerReformatter _defaultOptions](self, "_defaultOptions", (_QWORD)v14), self->_fontSize, self->_maximumWidth);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v4;
}

- (void)_expandAllLocalParts
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[8];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = self->_reformattedAddresses;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v8 = objc_msgSend(v7, "middleTruncationRange");
        if (v8 != 0x7FFFFFFFFFFFFFFFLL && v9 != 0)
        {
          v11 = v8 + v9;
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __50__MFAddressPickerReformatter__expandAllLocalParts__block_invoke;
          v13[3] = &unk_1E5A655B8;
          v13[6] = v8;
          v13[7] = v9;
          v13[4] = v7;
          v13[5] = self;
          v12 = MFLastIndexInRangePassingTest(v8, v8 + v9, v13);
          if (v12 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v7, "setMiddleTruncationRange:", v12, v11 - v12);
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

BOOL __50__MFAddressPickerReformatter__expandAllLocalParts__block_invoke(uint64_t a1, uint64_t a2)
{
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "setMiddleTruncationRange:", a2, *(_QWORD *)(a1 + 48) - a2 + *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "widthWithFontSize:maximumWidth:options:", objc_msgSend(*(id *)(a1 + 40), "_defaultOptions") | 2, *(double *)(*(_QWORD *)(a1 + 40) + 48), *(double *)(*(_QWORD *)(a1 + 40) + 24));
  return v3 <= *(double *)(*(_QWORD *)(a1 + 40) + 24);
}

- (BOOL)_reformattedAddressesByDisplayedStringsAreUnique:(id)a3
{
  char v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__MFAddressPickerReformatter__reformattedAddressesByDisplayedStringsAreUnique___block_invoke;
  v5[3] = &unk_1E5A655E0;
  v5[4] = &v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

unint64_t __79__MFAddressPickerReformatter__reformattedAddressesByDisplayedStringsAreUnique___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  unint64_t result;

  result = objc_msgSend(a3, "count");
  if (result >= 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (id)_saveMiddleTruncationRanges
{
  NSArray **p_reformattedAddresses;
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;
  NSRange v16;

  v15 = *MEMORY[0x1E0C80C00];
  p_reformattedAddresses = &self->_reformattedAddresses;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_reformattedAddresses, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *p_reformattedAddresses;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v16.location = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "middleTruncationRange", (_QWORD)v10);
        NSStringFromRange(v16);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)_restoreMiddleTruncationRanges:(id)a3
{
  id v4;
  NSArray *reformattedAddresses;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  reformattedAddresses = self->_reformattedAddresses;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__MFAddressPickerReformatter__restoreMiddleTruncationRanges___block_invoke;
  v7[3] = &unk_1E5A65608;
  v8 = v4;
  v6 = v4;
  -[NSArray enumerateObjectsUsingBlock:](reformattedAddresses, "enumerateObjectsUsingBlock:", v7);

}

void __61__MFAddressPickerReformatter__restoreMiddleTruncationRanges___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  NSString *v5;
  NSRange v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = NSRangeFromString(v5);
  objc_msgSend(v7, "setMiddleTruncationRange:", v6.location, v6.length);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reformattedAddresses, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
}

@end
