@implementation FCAnalyticsEnvelopeContentTypeConfigsByContentType

void __FCAnalyticsEnvelopeContentTypeConfigsByContentType_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  id v31;

  v31 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("url_key"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v5;
  if (v5 && (v6 = objc_msgSend(v5, "unsignedIntegerValue"), v6 < objc_msgSend(*(id *)(a1 + 32), "count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEndpointURLString:", v7);

    objc_msgSend(v4, "setGroupingTag:", v6);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("seed_time"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = v8;
  else
    v11 = 0;
  v29 = v11;
  if (v9)
    objc_msgSend(v4, "setSeedTime:", objc_msgSend(v9, "unsignedIntegerValue"));
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("content_header_name"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("content_header_value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12 != 0;
  v15 = v13 == 0;
  if (v14 != v15)
  {
    objc_msgSend(v4, "setContentHeaderName:", v12);
    objc_msgSend(v4, "setContentHeaderValue:", v13);
  }
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("sampling_floor"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = &unk_1E470AF10;
  if (v16)
    v18 = (void *)v16;
  v19 = v18;

  v20 = objc_msgSend(v19, "unsignedIntegerValue");
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("sampling_ceil"));
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = &unk_1E470AF28;
  if (v21)
    v23 = (void *)v21;
  v24 = v23;

  v25 = objc_msgSend(v24, "unsignedIntegerValue");
  if (v20 <= 0x64uLL && v25 <= 0x64uLL && v20 <= v25)
  {
    objc_msgSend(v4, "setSamplingFloor:", v20);
    objc_msgSend(v4, "setSamplingCeiling:", v25);
    if ((v29 & (v14 ^ v15)) != 0)
    {
      v26 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v4, v27);

    }
  }

}

@end
