@implementation UIHoverStyle(DOCExtensions)

+ (uint64_t)doc_roundedRectWithConstantCornerRadius:()DOCExtensions inset:
{
  return objc_msgSend(a1, "_doc_roundedRectWithCornerRadius:cornerRadiusIsStretchy:insets:", 0, a3, a4, a4, a4, a4);
}

+ (uint64_t)doc_roundedRectWithStretchyCornerRadius:()DOCExtensions inset:
{
  return objc_msgSend(a1, "_doc_roundedRectWithCornerRadius:cornerRadiusIsStretchy:insets:", 1, a3, a4, a4, a4, a4);
}

+ (uint64_t)doc_roundedRectWithConstantCornerRadius:()DOCExtensions insets:
{
  return objc_msgSend(a1, "_doc_roundedRectWithCornerRadius:cornerRadiusIsStretchy:insets:", 0);
}

+ (uint64_t)doc_roundedRectWithStretchyCornerRadius:()DOCExtensions insets:
{
  return objc_msgSend(a1, "_doc_roundedRectWithCornerRadius:cornerRadiusIsStretchy:insets:", 1);
}

+ (id)_doc_roundedRectWithCornerRadius:()DOCExtensions cornerRadiusIsStretchy:insets:
{
  DOCFixedRadiusRoundedRectShapeProvider *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if ((a8 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6D88], "rectShapeWithCornerRadius:", a1);
    v12 = (DOCFixedRadiusRoundedRectShapeProvider *)objc_claimAutoreleasedReturnValue();
    -[DOCFixedRadiusRoundedRectShapeProvider shapeByApplyingInsets:](v12, "shapeByApplyingInsets:", a2, a3, a4, a5);
  }
  else
  {
    v12 = -[DOCFixedRadiusRoundedRectShapeProvider initWithCornerRadius:insets:]([DOCFixedRadiusRoundedRectShapeProvider alloc], "initWithCornerRadius:insets:", a1, a2, a3, a4, a5);
    objc_msgSend(MEMORY[0x24BDF6D88], "shapeWithProvider:", v12);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDF6AC0];
  objc_msgSend(MEMORY[0x24BDF6AB0], "effect");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "styleWithEffect:shape:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (uint64_t)doc_capsuleWithInset:()DOCExtensions
{
  return objc_msgSend(a1, "doc_capsuleWithInsets:", a3, a3, a3, a3);
}

+ (id)doc_capsuleWithInsets:()DOCExtensions
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDF6D88], "capsuleShape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shapeByApplyingInsets:", a1, a2, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF6AC0];
  objc_msgSend(MEMORY[0x24BDF6AB0], "effect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "styleWithEffect:shape:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)doc_circleWithInset:()DOCExtensions
{
  return objc_msgSend(a1, "doc_circleWithInsets:", a3, a3, a3, a3);
}

+ (id)doc_circleWithInsets:()DOCExtensions
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDF6D88], "circleShape");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shapeByApplyingInsets:", a1, a2, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDF6AC0];
  objc_msgSend(MEMORY[0x24BDF6AB0], "effect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "styleWithEffect:shape:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
