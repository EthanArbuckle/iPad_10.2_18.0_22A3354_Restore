@implementation ARLineCloud

- (ARLineCloud)initWithLineCloudData:(id)a3
{
  id v4;
  ARLineCloud *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  NSArray *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  float v17;
  NSArray *lines;
  float64x2_t v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ARLineCloud;
  v5 = -[ARLineCloud init](&v21, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "bytes");
    v8 = objc_msgSend(v6, "length");
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v8 / 0x48);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (v8 >= 0x48)
    {
      if (v8 / 0x48 <= 1)
        v10 = 1;
      else
        v10 = v8 / 0x48;
      v11 = v7 + 32;
      do
      {
        v12 = *(double *)v11;
        v13 = *(double *)(v11 + 8);
        v14 = *(_QWORD *)(v11 + 32);
        v20 = *(float64x2_t *)(v11 - 32);
        v15 = (void *)objc_opt_new();
        objc_msgSend(v15, "setIdentifier:", v14);
        objc_msgSend(v15, "setStartPoint:", COERCE_DOUBLE(vcvt_f32_f64(v20)));
        *(float *)&v16 = v12;
        v17 = v13;
        *((float *)&v16 + 1) = v17;
        objc_msgSend(v15, "setEndPoint:", v16);
        -[NSArray addObject:](v9, "addObject:", v15);

        v11 += 72;
        --v10;
      }
      while (v10);
    }
    lines = v5->_lines;
    v5->_lines = v9;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v6 = -[NSArray copyWithZone:](self->_lines, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (NSArray)lines
{
  return self->_lines;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lines, 0);
}

@end
