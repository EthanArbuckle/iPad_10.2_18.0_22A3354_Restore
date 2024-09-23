@implementation CRKOverlayButton

- (void)setBackgroundColor:(id)a3 forState:(unint64_t)a4
{
  id v6;
  CGContext *CurrentContext;
  id v8;
  CGColor *v9;
  id v10;
  CGSize v11;
  CGRect v12;

  v6 = a3;
  v11.width = 1.0;
  v11.height = 1.0;
  UIGraphicsBeginImageContext(v11);
  CurrentContext = UIGraphicsGetCurrentContext();
  v8 = objc_retainAutorelease(v6);
  v9 = (CGColor *)objc_msgSend(v8, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v9);
  v12.origin.x = 0.0;
  v12.origin.y = 0.0;
  v12.size.width = 1.0;
  v12.size.height = 1.0;
  CGContextFillRect(CurrentContext, v12);
  UIGraphicsGetImageFromCurrentImageContext();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[CRKOverlayButton setBackgroundImage:forState:](self, "setBackgroundImage:forState:", v10, a4);

}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  _QWORD v4[5];
  BOOL v5;
  _QWORD v6[5];
  BOOL v7;

  if (a4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __41__CRKOverlayButton_setSelected_animated___block_invoke;
    v6[3] = &unk_24DA4D418;
    v6[4] = self;
    v7 = a3;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __41__CRKOverlayButton_setSelected_animated___block_invoke_2;
    v4[3] = &unk_24DA4D440;
    v4[4] = self;
    v5 = a3;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:completion:", v6, v4, 0.3);
  }
  else
  {
    -[CRKOverlayButton setSelected:](self, "setSelected:", a3);
  }
}

void __41__CRKOverlayButton_setSelected_animated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

void __41__CRKOverlayButton_setSelected_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setSelected:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_backgroundView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  v3 = 0.0;
  if (!*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  objc_msgSend(v2, "setAlpha:", v3);

}

@end
