@implementation LUICollectionViewStyle

+ (id)sharedStyle
{
  if (qword_100088D48 != -1)
    dispatch_once(&qword_100088D48, &stru_100068F88);
  return (id)qword_100088D40;
}

- (id)avatarNameFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 17.0);
}

- (double)spaceBetweenAvatarAndName
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUICollectionViewStyle avatarNameFont](self, "avatarNameFont"));
  -[LUICollectionViewStyle spaceBetweenAvatarAndNameForFont:](self, "spaceBetweenAvatarAndNameForFont:", v3);
  v5 = v4;

  return v5;
}

- (double)spaceBetweenAvatarAndNameForFont:(id)a3
{
  id v3;
  double v4;
  double v5;

  v3 = a3;
  +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  objc_msgSend(v3, "ascender");
  v5 = v4;

  return 24.0 - v5;
}

- (double)minCellSpacing
{
  +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  return 10.0;
}

- (double)maxCellSpacing
{
  +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  return 30.0;
}

- (double)fontYDiameter
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[LUICollectionViewStyle spaceBetweenAvatarAndName](self, "spaceBetweenAvatarAndName");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUICollectionViewStyle avatarNameFont](self, "avatarNameFont"));
  objc_msgSend(v5, "ascender");
  v7 = v4 + v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUICollectionViewStyle avatarNameFont](self, "avatarNameFont"));
  objc_msgSend(v8, "descender");
  v10 = v7 - v9;

  return v10;
}

- (double)verticalItemSpaceForSpaceWithFontDescender:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUICollectionViewStyle avatarNameFont](self, "avatarNameFont"));
  objc_msgSend(v4, "descender");
  v6 = v5 + a3;

  return v6;
}

- (CGSize)itemSizeForItemCount:(unint64_t)a3
{
  uint64_t **v5;
  double v6;
  double v7;
  uint64_t *v8;
  double v9;
  double v10;
  CGSize result;

  if (a3)
  {
    if (+[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL"))
    {
      if (a3 >= 4)
      {
        v8 = &qword_100064218;
        goto LABEL_11;
      }
      v5 = &off_100068FA8;
    }
    else
    {
      if (a3 >= 0xB)
      {
        v8 = &qword_100064208;
        goto LABEL_11;
      }
      v5 = &off_100068FC0;
    }
    v8 = v5[a3 - 1];
LABEL_11:
    v6 = *(double *)v8;
    -[LUICollectionViewStyle fontYDiameter](self, "fontYDiameter");
    v7 = v6 + v9;
    goto LABEL_12;
  }
  v6 = 0.0;
  v7 = 0.0;
LABEL_12:
  v10 = v6;
  result.height = v7;
  result.width = v10;
  return result;
}

- (CGSize)gridInfoForItemCount:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  _BOOL4 v8;
  CGSize result;

  if (a3)
  {
    v3 = a3;
    if (+[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL"))
    {
      if (v3 - 1 < 5)
      {
        v4 = 1;
LABEL_25:
        v5 = (double)v4;
        v6 = (double)v3;
        goto LABEL_26;
      }
      if (v3 - 7 < 2)
      {
        v3 = 4;
        v4 = 2;
        goto LABEL_25;
      }
      if (v3 == 6)
      {
        v8 = sub_10000D3E8();
        v4 = 1;
        if (v8)
        {
          v3 = 6;
        }
        else
        {
          v4 = 2;
          v3 = 3;
        }
        goto LABEL_25;
      }
      if (!sub_10000D3E8())
      {
        if (v3 == 5 * (v3 / 5))
          v4 = v3 / 5;
        else
          v4 = v3 / 5 + 1;
        v3 = 5;
        goto LABEL_25;
      }
      if (__ROR8__(0xAAAAAAAAAAAAAAABLL * v3, 1) <= 0x2AAAAAAAAAAAAAAAuLL)
        v4 = v3 / 6;
      else
        v4 = v3 / 6 + 1;
    }
    else
    {
      if (v3 < 0xB)
      {
        v7 = 8 * v3 - 8;
        v4 = *(_QWORD *)((char *)&unk_1000640C0 + v7);
        v3 = *(_QWORD *)((char *)&unk_100064110 + v7);
        goto LABEL_25;
      }
      v4 = v3 / 6;
      if (v3 % 6)
        ++v4;
    }
    v3 = 6;
    goto LABEL_25;
  }
  v5 = 0.0;
  v6 = 0.0;
LABEL_26:
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)itemSpacingForItemCount:(unint64_t)a3
{
  double v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  if (a3)
  {
    if (+[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL"))
    {
      if (a3 - 2 < 2)
      {
        v5 = 0.0;
        *(double *)&v6 = 44.0;
LABEL_11:
        v7 = *(double *)&v6;
        goto LABEL_15;
      }
      v7 = 0.0;
      v5 = 0.0;
      if (a3 != 1)
      {
        -[LUICollectionViewStyle verticalItemSpaceForSpaceWithFontDescender:](self, "verticalItemSpaceForSpaceWithFontDescender:", 40.0, 0.0);
        v5 = v9;
        *(double *)&v6 = 56.0;
        goto LABEL_11;
      }
    }
    else
    {
      v7 = 0.0;
      v5 = 0.0;
      switch(a3)
      {
        case 1uLL:
          break;
        case 2uLL:
          *(double *)&v6 = 60.0;
          goto LABEL_11;
        case 3uLL:
          v7 = 41.0;
          break;
        case 4uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
          -[LUICollectionViewStyle verticalItemSpaceForSpaceWithFontDescender:](self, "verticalItemSpaceForSpaceWithFontDescender:", 28.0, 0.0);
          v5 = v8;
          *(double *)&v6 = 46.0;
          goto LABEL_11;
        default:
          -[LUICollectionViewStyle verticalItemSpaceForSpaceWithFontDescender:](self, "verticalItemSpaceForSpaceWithFontDescender:", 32.0, 0.0);
          v5 = v10;
          v7 = 33.0;
          break;
      }
    }
  }
  else
  {
    v7 = 0.0;
    v5 = 0.0;
  }
LABEL_15:
  result.height = v5;
  result.width = v7;
  return result;
}

- (UIEdgeInsets)headerEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 60.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 60.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v2;
  result.top = v3;
  return result;
}

- (double)fixedHeaderHeight
{
  unsigned int v2;
  double result;

  v2 = +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  result = 200.0;
  if (v2)
    return 300.0;
  return result;
}

@end
