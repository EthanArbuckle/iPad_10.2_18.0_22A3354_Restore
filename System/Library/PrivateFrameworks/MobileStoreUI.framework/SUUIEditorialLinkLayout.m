@implementation SUUIEditorialLinkLayout

- (SUUIEditorialLinkLayout)initWithLayoutRequest:(id)a3
{
  id v4;
  SUUIEditorialLinkLayout *v5;
  CGFloat v6;
  void *v7;
  uint64_t v8;
  NSArray *links;
  uint64_t v10;
  uint64_t v11;
  CGSize *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  double v32;
  double *p_width;
  float v34;
  uint64_t v35;
  double v36;
  _QWORD v38[5];
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)SUUIEditorialLinkLayout;
  v5 = -[SUUIEditorialLinkLayout init](&v43, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "width");
    v5->_totalSize.width = v6;
    objc_msgSend(v4, "links");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    links = v5->_links;
    v5->_links = (NSArray *)v8;

    v10 = -[NSArray count](v5->_links, "count");
    if (v10 >= 1)
    {
      v11 = v10;
      v12 = (CGSize *)malloc_type_malloc(16 * v10, 0x1000040451B5BE8uLL);
      v5->_sizes = v12;
      if (v12)
      {
        v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
        objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 12.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKey:", v14, *MEMORY[0x24BEBB360]);

        SUUIBundle();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        SUUILinkArrowImage((uint64_t)v15, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "size");
        v19 = v18;
        v21 = v20;
        v22 = 0;
        v23 = 0;
        v24 = 0.0;
        do
        {
          -[NSArray objectAtIndex:](v5->_links, "objectAtIndex:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "title");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "sizeWithAttributes:", v13);
          v28 = v27;
          v30 = v29;

          v31 = v30;
          v32 = ceilf(v31);
          if (v21 >= v32)
            v32 = v21;
          p_width = &v5->_sizes[v22].width;
          v34 = v19 + v28 + 3.0;
          *p_width = ceilf(v34);
          p_width[1] = v32;
          if (v24 < v32)
            v24 = v32;

          ++v23;
          ++v22;
        }
        while (v11 != v23);
        v39 = 0;
        v40 = &v39;
        v41 = 0x2020000000;
        v42 = 0;
        v38[0] = MEMORY[0x24BDAC760];
        v38[1] = 3221225472;
        v38[2] = __49__SUUIEditorialLinkLayout_initWithLayoutRequest___block_invoke;
        v38[3] = &unk_2511FCC50;
        v38[4] = &v39;
        -[SUUIEditorialLinkLayout enumerateLinesUsingBlock:](v5, "enumerateLinesUsingBlock:", v38);
        v35 = v40[3];
        v36 = v24 * (double)v35;
        if (v35 >= 2)
          v36 = v36 + (float)((float)(v35 - 1) * 8.0);
        v5->_totalSize.height = v36;
        _Block_object_dispose(&v39, 8);

      }
    }
  }

  return v5;
}

uint64_t __49__SUUIEditorialLinkLayout_initWithLayoutRequest___block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

- (void)dealloc
{
  CGSize *sizes;
  objc_super v4;

  sizes = self->_sizes;
  if (sizes)
    free(sizes);
  v4.receiver = self;
  v4.super_class = (Class)SUUIEditorialLinkLayout;
  -[SUUIEditorialLinkLayout dealloc](&v4, sel_dealloc);
}

- (void)enumerateLinesUsingBlock:(id)a3
{
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double width;
  double v13;
  void (**v14)(id, uint64_t, uint64_t, uint64_t, __n128);
  double v15;
  void (**v16)(id, uint64_t, uint64_t, uint64_t, __n128);

  v16 = (void (**)(id, uint64_t, uint64_t, uint64_t, __n128))a3;
  v4 = -[NSArray count](self->_links, "count");
  v6 = v4 - 1;
  if (v4 >= 1)
  {
    v7 = v4;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v5.n128_u64[0] = 0;
    do
    {
      width = self->_sizes[v11].width;
      v13 = self->_totalSize.width;
      v14 = v16;
      if (width >= v13)
      {
        if (v10)
        {
          v16[2](v16, v9, v10, v8, v5);
          v14 = v16;
          ++v8;
          v9 = v11;
        }
        v14[2](v14, v9, 1, v8, v5);
        v10 = 0;
        ++v11;
        ++v8;
        v5.n128_u64[0] = 0;
        v9 = v11;
      }
      else
      {
        v15 = v5.n128_f64[0] + width;
        if (v5.n128_f64[0] + width >= v13)
        {
          ((void (*)(void))v16[2])();
          v10 = 0;
          v15 = self->_sizes[v11].width;
          ++v8;
          v9 = v11;
        }
        else
        {
          ++v10;
        }
        if (v11 == v6)
        {
          v10 = v7 - v9;
          ((void (*)(void (**)(id, uint64_t, uint64_t, uint64_t, __n128), uint64_t, uint64_t, uint64_t))v16[2])(v16, v9, v7 - v9, v8);
        }
        v5.n128_f64[0] = v15 + 15.0;
        ++v11;
      }
    }
    while (v11 != v7);
  }

}

- (CGSize)sizeForLinkAtIndex:(int64_t)a3
{
  CGSize *v5;
  double width;
  double height;
  CGSize result;

  if (!self->_sizes || -[NSArray count](self->_links, "count") <= a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Invalid index: %ld"), a3);
  v5 = &self->_sizes[a3];
  width = v5->width;
  height = v5->height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)totalSize
{
  double width;
  double height;
  CGSize result;

  width = self->_totalSize.width;
  height = self->_totalSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (NSArray)links
{
  return self->_links;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_links, 0);
}

@end
