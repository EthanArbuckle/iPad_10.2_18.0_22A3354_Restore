@implementation HKTextBlockClosestToPoint

uint64_t ___HKTextBlockClosestToPoint_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double MidX;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double MidY;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "boundingBox");
  MidX = CGRectGetMidX(v32);
  objc_msgSend(v6, "boundingBox");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v33.origin.x = v9;
  v33.origin.y = v11;
  v33.size.width = v13;
  v33.size.height = v15;
  MidY = CGRectGetMidY(v33);
  objc_msgSend(v5, "boundingBox");
  v17 = CGRectGetMidX(v34);
  objc_msgSend(v5, "boundingBox");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  v35.origin.x = v19;
  v35.origin.y = v21;
  v35.size.width = v23;
  v35.size.height = v25;
  v26 = CGRectGetMidY(v35);
  v27 = *(double *)(a1 + 32);
  v28 = *(double *)(a1 + 40);
  v29 = (MidY - v28) * (MidY - v28) + (MidX - v27) * (MidX - v27);
  v30 = (v26 - v28) * (v26 - v28) + (v17 - v27) * (v17 - v27);
  if (v29 < v30)
    return -1;
  else
    return v30 < v29;
}

@end
