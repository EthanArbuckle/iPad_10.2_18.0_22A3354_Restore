@implementation ABDeviceButtonAnimator

- (id)initWithBaseColor:(id *)a1
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)ABDeviceButtonAnimator;
    a1 = (id *)objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      v4 = objc_opt_new();
      v5 = a1[1];
      a1[1] = (id)v4;

      v6 = objc_opt_new();
      v7 = a1[2];
      a1[2] = (id)v6;

      objc_msgSend(a1[2], "setBounce:duration:", 0.0, 0.35);
      objc_msgSend(a1[2], "setOutput:", 0.0);
      v8 = objc_opt_new();
      v9 = a1[3];
      a1[3] = (id)v8;

      objc_msgSend(a1[3], "setOutput:", 0.0);
      objc_msgSend(a1[3], "setBounce:duration:", 0.0, 0.45);
      v10 = objc_opt_new();
      v11 = a1[4];
      a1[4] = (id)v10;

      objc_msgSend(a1[4], "setOutput:", 0.0);
      -[ABDeviceButtonAnimator setBaseColor:animated:]((uint64_t)a1, v3, 0);
    }
  }

  return a1;
}

- (void)setBaseColor:(int)a3 animated:
{
  id v5;
  double v6;
  void *v7;
  id v8;

  v5 = a2;
  if (a1)
  {
    v8 = v5;
    -[ABColorInterpolator setColor:animated:](*(_QWORD *)(a1 + 8), v5, a3);
    v6 = 0.0;
    if (v8)
      v6 = 1.0;
    v7 = *(void **)(a1 + 16);
    if (a3)
      objc_msgSend(v7, "setInput:", v6);
    else
      objc_msgSend(v7, "setOutput:", v6);
    v5 = v8;
  }

}

- (void)setActive:(uint64_t)a1
{
  char v2;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v2 = a2;
    if (*(unsigned __int8 *)(a1 + 48) != a2)
    {
      *(_BYTE *)(a1 + 48) = a2;
      objc_msgSend(*(id *)(a1 + 32), "setInput:", 0.0);
      objc_msgSend(*(id *)(a1 + 24), "setInput:", 0.0);
      *(_BYTE *)(a1 + 49) = 0;
      *(_QWORD *)(a1 + 56) = 0;
      if ((v2 & 1) != 0)
      {
        v4 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(MEMORY[0x24BDBCE60], "now");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceReferenceDate");
        objc_msgSend(v4, "numberWithDouble:", v5 + -5.0 + 0.75);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = v6;

        v8 = v9;
      }
      else
      {
        v8 = *(void **)(a1 + 40);
        *(_QWORD *)(a1 + 40) = 0;
      }

    }
  }
}

- (id)color
{
  id *v1;
  void *v2;
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;

  v1 = (id *)a1;
  if (a1)
  {
    -[ABColorInterpolator color](a1[1]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1[4], "output");
    if (v2)
    {
      v8 = 0.0;
      v9 = 0.0;
      v4 = v3 * 0.2 + 0.0;
      v6 = 0.0;
      v7 = 0.0;
      objc_msgSend(v2, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", fmin(v4 + v9, 1.0), fmin(v4 + v8, 1.0), fmin(v4 + v7, 1.0), v6);
      v1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (double)opacity
{
  double result;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 16), "output");
  return result;
}

- (double)pressProgress
{
  double result;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 24), "output");
  return result;
}

- (uint64_t)update
{
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 48))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "timeIntervalSinceReferenceDate");
      v4 = v3;

      objc_msgSend(*(id *)(v1 + 40), "doubleValue");
      if (v4 - v5 > 5.0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v4);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = *(void **)(v1 + 40);
        *(_QWORD *)(v1 + 40) = v6;

        result = objc_msgSend(*(id *)(v1 + 24), "setInput:", 1.0);
        *(_BYTE *)(v1 + 49) = 0;
        v8 = 1;
LABEL_5:
        *(_QWORD *)(v1 + 56) = v8;
        return result;
      }
      result = objc_msgSend(*(id *)(v1 + 40), "doubleValue");
      if (v4 - v9 > 2.0)
      {
        *(_QWORD *)(v1 + 56) = 0;
        return result;
      }
      objc_msgSend(*(id *)(v1 + 40), "doubleValue");
      if (v4 - v10 > 1.0)
      {
        objc_msgSend(*(id *)(v1 + 24), "setInput:", 0.0);
        objc_msgSend(*(id *)(v1 + 32), "setBounce:duration:", 0.0, 2.0);
        v11 = *(void **)(v1 + 32);
        v12 = 0.0;
        return objc_msgSend(v11, "setInput:", v12);
      }
      result = objc_msgSend(*(id *)(v1 + 40), "doubleValue");
      if (v4 - v13 > 0.8)
      {
        *(_BYTE *)(v1 + 49) = 1;
        v8 = 3;
        goto LABEL_5;
      }
      result = objc_msgSend(*(id *)(v1 + 40), "doubleValue");
      if (v4 - v14 > 0.1)
      {
        *(_QWORD *)(v1 + 56) = 2;
        objc_msgSend(*(id *)(v1 + 32), "setBounce:duration:", 0.0, 3.0);
        v11 = *(void **)(v1 + 32);
        v12 = 1.0;
        return objc_msgSend(v11, "setInput:", v12);
      }
    }
  }
  return result;
}

- (uint64_t)islandMode
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (BOOL)isRingHighlightVisible
{
  if (result)
    return *(_BYTE *)(result + 49) != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonReleaseTimestamp, 0);
  objc_storeStrong((id *)&self->_buttonGlowInterpolator, 0);
  objc_storeStrong((id *)&self->_buttonPressInterpolator, 0);
  objc_storeStrong((id *)&self->_highlightOpacityInterpolator, 0);
  objc_storeStrong((id *)&self->_highlightColorInterpolator, 0);
}

@end
