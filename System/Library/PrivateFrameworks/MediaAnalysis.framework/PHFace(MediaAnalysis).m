@implementation PHFace(MediaAnalysis)

- (BOOL)vcp_hasFace
{
  double v2;
  double v3;
  double v5;

  objc_msgSend(a1, "size");
  if (v2 != 0.0)
    return 1;
  objc_msgSend(a1, "centerX");
  if (v3 != 0.0)
    return 1;
  objc_msgSend(a1, "centerY");
  return v5 != 0.0;
}

- (double)vcp_normalizedFaceBounds
{
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1, "size");
  v3 = v2;
  v4 = objc_msgSend(a1, "sourceWidth");
  v5 = objc_msgSend(a1, "sourceHeight");
  if (v4 <= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v3 * (double)v6 / (double)objc_msgSend(a1, "sourceWidth");
  objc_msgSend(a1, "sourceHeight");
  objc_msgSend(a1, "centerX");
  v9 = fmax(v8 - v7 * 0.5, 0.0);
  objc_msgSend(a1, "centerY");
  objc_msgSend(a1, "centerX");
  objc_msgSend(a1, "centerY");
  return v9;
}

- (BOOL)vcp_hasBody
{
  double v2;
  double v3;
  double v4;
  double v6;

  objc_msgSend(a1, "bodyWidth");
  if (v2 != 0.0)
    return 1;
  objc_msgSend(a1, "bodyHeight");
  if (v3 != 0.0)
    return 1;
  objc_msgSend(a1, "bodyCenterX");
  if (v4 != 0.0)
    return 1;
  objc_msgSend(a1, "bodyCenterY");
  return v6 != 0.0;
}

- (double)vcp_normalizedBodyBounds
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend(a1, "bodyCenterX");
  v3 = v2;
  objc_msgSend(a1, "bodyWidth");
  v5 = v3 - v4 * 0.5;
  objc_msgSend(a1, "bodyCenterY");
  objc_msgSend(a1, "bodyHeight");
  objc_msgSend(a1, "bodyWidth");
  objc_msgSend(a1, "bodyHeight");
  return v5;
}

@end
