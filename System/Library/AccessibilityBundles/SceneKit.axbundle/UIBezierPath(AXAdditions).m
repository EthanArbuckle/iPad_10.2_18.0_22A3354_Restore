@implementation UIBezierPath(AXAdditions)

+ (id)accessibilityBezierPathWithSCNVector3Points:()AXAdditions
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(a1, "bezierPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "SCNVector3Value");
    v8 = v7;
    objc_msgSend(v4, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "SCNVector3Value");
    objc_msgSend(v5, "moveToPoint:", v8, v10);

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __73__UIBezierPath_AXAdditions__accessibilityBezierPathWithSCNVector3Points___block_invoke;
    v13[3] = &unk_2503354F0;
    v11 = v5;
    v14 = v11;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);
    objc_msgSend(v11, "closePath");

  }
  return v5;
}

@end
