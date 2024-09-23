@implementation PKMathRecognitionTokenView

+ (BOOL)shouldAddViewForToken:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "errors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(v3, "alternatives");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "count") != 0;

  }
  return v5;
}

+ (PKMathRecognitionTokenView)viewForToken:(void *)a3 item:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PKMathRecognitionTokenView *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend((id)objc_opt_self(), "shouldAddViewForToken:", v5))
  {
    v7 = objc_msgSend(v5, "characterRange");
    -[PKMathRecognitionItem _strokeIndexesForCharacterRange:]((uint64_t)v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_alloc_init(PKMathRecognitionTokenView);
      -[PKMathRecognitionTokenView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PKMathRecognitionTokenView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKMathRecognitionTokenView setBackgroundColor:](v10, "setBackgroundColor:", v11);

      objc_storeStrong((id *)&v10->_item, a3);
      objc_storeStrong((id *)&v10->_token, a2);
      v10->_strokeBounds.origin.x = -[PKMathRecognitionItem _boundsForStrokeIndexes:](v6, v9);
      v10->_strokeBounds.origin.y = v12;
      v10->_strokeBounds.size.width = v13;
      v10->_strokeBounds.size.height = v14;
      v10->_timestamp = CACurrentMediaTime();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)updateFrameForDrawingTransform:(uint64_t)a1
{
  __int128 v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  CGAffineTransform v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  if (a1)
  {
    v15 = *(CGRect *)(a1 + 448);
    v3 = a2[1];
    *(_OWORD *)&v14.a = *a2;
    *(_OWORD *)&v14.c = v3;
    *(_OWORD *)&v14.tx = a2[2];
    v16 = CGRectApplyAffineTransform(v15, &v14);
    x = v16.origin.x;
    y = v16.origin.y;
    width = v16.size.width;
    height = v16.size.height;
    objc_msgSend((id)a1, "frame");
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    if (!CGRectEqualToRect(v17, v22))
    {
      v18.origin.x = x;
      v18.origin.y = y;
      v18.size.width = width;
      v18.size.height = height;
      v19 = CGRectInset(v18, -4.0, -4.0);
      objc_msgSend((id)a1, "setFrame:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
      if (!*(_QWORD *)(a1 + 416))
      {
        v8 = objc_alloc_init(MEMORY[0x1E0CD2840]);
        v9 = *(void **)(a1 + 416);
        *(_QWORD *)(a1 + 416) = v8;

        objc_msgSend(*(id *)(a1 + 416), "setLineWidth:", 2.0);
        objc_msgSend(*(id *)(a1 + 416), "setLineJoin:", *MEMORY[0x1E0CD3030]);
        objc_msgSend(*(id *)(a1 + 416), "setLineCap:", *MEMORY[0x1E0CD3010]);
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(*(id *)(a1 + 416), "setFillColor:", objc_msgSend(v10, "CGColor"));

        objc_msgSend(*(id *)(a1 + 416), "setLineDashPattern:", &unk_1E77ECDD8);
        objc_msgSend((id)a1, "layer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSublayer:", *(_QWORD *)(a1 + 416));

      }
      if (objc_msgSend(*(id *)(a1 + 424), "type") == 4)
        objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(*(id *)(a1 + 416), "setStrokeColor:", objc_msgSend(v12, "CGColor"));

      objc_msgSend((id)a1, "bounds");
      v21 = CGRectInset(v20, 1.0, 1.0);
      objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, 4.0);
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(*(id *)(a1 + 416), "setPath:", objc_msgSend(v13, "CGPath"));

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
}

@end
