@implementation ABColorInterpolator

- (ABColorInterpolator)init
{
  ABColorInterpolator *v2;
  uint64_t v3;
  ABFloatSpringProperty *red;
  uint64_t v5;
  ABFloatSpringProperty *green;
  uint64_t v7;
  ABFloatSpringProperty *blue;
  uint64_t v9;
  ABFloatSpringProperty *alpha;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ABColorInterpolator;
  v2 = -[ABColorInterpolator init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    red = v2->_red;
    v2->_red = (ABFloatSpringProperty *)v3;

    -[ABFloatSpringProperty setBounce:duration:](v2->_red, "setBounce:duration:", 0.0, 0.25);
    v5 = objc_opt_new();
    green = v2->_green;
    v2->_green = (ABFloatSpringProperty *)v5;

    -[ABFloatSpringProperty setBounce:duration:](v2->_green, "setBounce:duration:", 0.0, 0.25);
    v7 = objc_opt_new();
    blue = v2->_blue;
    v2->_blue = (ABFloatSpringProperty *)v7;

    -[ABFloatSpringProperty setBounce:duration:](v2->_blue, "setBounce:duration:", 0.0, 0.25);
    v9 = objc_opt_new();
    alpha = v2->_alpha;
    v2->_alpha = (ABFloatSpringProperty *)v9;

    -[ABFloatSpringProperty setBounce:duration:](v2->_alpha, "setBounce:duration:", 0.0, 0.25);
    v2->_isEmpty = 1;
  }
  return v2;
}

- (void)setColor:(int)a3 animated:
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  void *v10;
  double v12;
  double v13;
  double v14;
  double v15;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = *(unsigned __int8 *)(a1 + 40);
    *(_BYTE *)(a1 + 40) = v5 == 0;
    v8 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    if (!*(_BYTE *)(a1 + 40))
    {
      v14 = 0.0;
      v15 = 0.0;
      v12 = 0.0;
      v13 = 0.0;
      objc_msgSend(v6, "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);
      if (v7)
        v9 = v6 == 0;
      else
        v9 = 1;
      v10 = *(void **)(a1 + 8);
      if (!v9 || a3 == 0)
      {
        objc_msgSend(v10, "setOutput:", v15);
        objc_msgSend(*(id *)(a1 + 16), "setOutput:", v14);
        objc_msgSend(*(id *)(a1 + 24), "setOutput:", v13);
        objc_msgSend(*(id *)(a1 + 32), "setOutput:", v12);
      }
      else
      {
        objc_msgSend(v10, "setInput:", v15);
        objc_msgSend(*(id *)(a1 + 16), "setInput:", v14);
        objc_msgSend(*(id *)(a1 + 24), "setInput:", v13);
        objc_msgSend(*(id *)(a1 + 32), "setInput:", v12);
      }
    }
  }

}

- (id)color
{
  id *v1;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;

  if (a1)
  {
    v1 = a1;
    if (*((_BYTE *)a1 + 40))
      return (id *)0;
    v3 = a1[6];
    if (v3)
    {
      v25 = 0.0;
      v26 = 0.0;
      v23 = 0.0;
      v24 = 0.0;
      objc_msgSend(v3, "getRed:green:blue:alpha:", &v26, &v25, &v24, &v23);
      v4 = v26;
      objc_msgSend(v1[1], "output");
      if (v4 == v5)
      {
        v6 = v25;
        objc_msgSend(v1[2], "output");
        if (v6 == v7)
        {
          v8 = v24;
          objc_msgSend(v1[3], "output");
          if (v8 == v9)
          {
            v10 = v23;
            objc_msgSend(v1[4], "output");
            if (v10 == v11)
              goto LABEL_11;
          }
        }
      }
    }
    v12 = (void *)MEMORY[0x24BDF6950];
    objc_msgSend(v1[1], "output");
    v14 = v13;
    objc_msgSend(v1[2], "output");
    v16 = v15;
    objc_msgSend(v1[3], "output");
    v18 = v17;
    objc_msgSend(v1[4], "output");
    objc_msgSend(v12, "colorWithRed:green:blue:alpha:", v14, v16, v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v1[6];
    v1[6] = (id)v20;

    if (!*((_BYTE *)v1 + 40))
LABEL_11:
      v22 = v1[6];
    else
      v22 = 0;
    a1 = (id *)v22;
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedOutputColor, 0);
  objc_storeStrong((id *)&self->_alpha, 0);
  objc_storeStrong((id *)&self->_blue, 0);
  objc_storeStrong((id *)&self->_green, 0);
  objc_storeStrong((id *)&self->_red, 0);
}

@end
