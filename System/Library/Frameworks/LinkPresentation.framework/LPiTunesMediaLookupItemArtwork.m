@implementation LPiTunesMediaLookupItemArtwork

- (LPiTunesMediaLookupItemArtwork)initWithDictionary:(id)a3
{
  id v5;
  LPiTunesMediaLookupItemArtwork *v6;
  LPiTunesMediaLookupItemArtwork *v7;
  LPiTunesMediaLookupItemArtwork *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPiTunesMediaLookupItemArtwork;
  v6 = -[LPiTunesMediaLookupItemArtwork init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)height
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("height"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (int64_t)width
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", CFSTR("width"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (id)colors
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15[0] = CFSTR("bgColor");
  v15[1] = CFSTR("textColor1");
  v15[2] = CFSTR("textColor2");
  v15[3] = CFSTR("textColor3");
  v15[4] = CFSTR("textColor4");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_dictionary, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v3, "setObject:forKey:", v9, v8);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void (**v13)(void *, const __CFString *, int64_t, _QWORD);
  void *v14;
  _QWORD v16[6];
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v10 = a5;
  v11 = a6;
  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("url"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    v24 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__1;
    v17[4] = __Block_byref_object_dispose__1;
    v18 = v12;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__LPiTunesMediaLookupItemArtwork_URLWithHeight_width_cropStyle_format___block_invoke;
    v16[3] = &unk_1E44A8C58;
    v16[4] = v17;
    v16[5] = &v19;
    v13 = (void (**)(void *, const __CFString *, int64_t, _QWORD))_Block_copy(v16);
    v13[2](v13, CFSTR("{h}"), a3, 0);
    v13[2](v13, CFSTR("{w}"), a4, 0);
    ((void (**)(void *, const __CFString *, int64_t, id))v13)[2](v13, CFSTR("{f}"), 0, v11);
    ((void (**)(void *, const __CFString *, int64_t, id))v13)[2](v13, CFSTR("{c}"), 0, v10);
    if (v20[5])
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __71__LPiTunesMediaLookupItemArtwork_URLWithHeight_width_cropStyle_format___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a4;
  v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "rangeOfString:options:", v16, 4);
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v8;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringValue");
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v12)
    {
      v13 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "mutableCopy");
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v9, v10, v7);
  }

}

+ (id)colorForColorKind:(id)a3 inColorDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = strtoul((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), 0, 16);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)BYTE2(v10) / 255.0, (double)BYTE1(v10) / 255.0, (double)v10 / 255.0, 1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
