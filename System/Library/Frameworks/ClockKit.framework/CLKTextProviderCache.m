@implementation CLKTextProviderCache

- (id)attributedStringAndSize:(CGSize *)a3 forMaxWidth:(double)a4 withStyle:(id)a5 generator:(id)a6
{
  id v10;
  void (**v11)(id, unint64_t);
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = (void (**)(id, unint64_t))a6;
  -[CLKTextProviderCache _cacheForStyle:](self, "_cacheForStyle:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "attributedStringAndSize:forMaxWidth:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v14 = objc_msgSend(v12, "attributedStringCount");
    v11[2](v11, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v13 = (void *)v15;
      while (1)
      {
        objc_msgSend(v13, "size");
        v17 = v16;
        v19 = v18;
        objc_msgSend(v10, "minimumScaleFactor");
        if (!CLKFloatEqualsFloat(v20, 0.0))
        {
          v21 = objc_alloc_init(MEMORY[0x24BEBD360]);
          objc_msgSend(v10, "minimumScaleFactor");
          objc_msgSend(v21, "setMinimumScaleFactor:");
          objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, v21, a4, 0.0);
          v24 = v23;
          v25 = v22;
          if (v22 < v19 || CLKFloatEqualsFloat(v22, v19))
          {
            v19 = v25;
            v17 = v24;
          }

        }
        objc_msgSend(v12, "addAttributedString:withSize:", v13, v17, v19);
        if (v14 > 9 || v17 <= a4)
          break;

        v14 = objc_msgSend(v12, "attributedStringCount");
        v11[2](v11, v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_12;
      }
      if (v14 >= 0xA)
      {
        CLKLoggingObjectForDomain(4);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v28 = 134218242;
          v29 = 10;
          v30 = 2112;
          v31 = v13;
          _os_log_error_impl(&dword_2114F4000, v26, OS_LOG_TYPE_ERROR, "Cache: Misbehaving textprovider? No string fits after %ld tries. Last string returned is %@", (uint8_t *)&v28, 0x16u);
        }

      }
      if (a3)
      {
        a3->width = v17;
        a3->height = v19;
      }
    }
    else
    {
LABEL_12:
      objc_msgSend(v12, "smallestAttributedStringAndSize:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v13;
}

- (id)attributedStringForIndex:(unint64_t)a3 withStyle:(id)a4 generator:(id)a5
{
  void (**v8)(id, unint64_t);
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v8 = (void (**)(id, unint64_t))a5;
  -[CLKTextProviderCache _cacheForStyle:](self, "_cacheForStyle:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "attributedStringCount");
  if (v10 <= a3)
  {
    v12 = v10;
    v13 = 0;
    do
    {
      v8[2](v8, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        break;
      objc_msgSend(v11, "size");
      objc_msgSend(v9, "addAttributedString:withSize:", v11);
      ++v12;
      v13 = v11;
    }
    while (v12 <= a3);
  }
  else
  {
    objc_msgSend(v9, "attributedStringForIndex:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_cacheForStyle:(id)a3
{
  id v4;
  NSMutableDictionary *cachesByStyle;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  _StringAndWidthCache *v8;

  v4 = a3;
  cachesByStyle = self->_cachesByStyle;
  if (!cachesByStyle)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v7 = self->_cachesByStyle;
    self->_cachesByStyle = v6;

    cachesByStyle = self->_cachesByStyle;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](cachesByStyle, "objectForKeyedSubscript:", v4);
  v8 = (_StringAndWidthCache *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(_StringAndWidthCache);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachesByStyle, "setObject:forKeyedSubscript:", v8, v4);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachesByStyle, 0);
}

@end
