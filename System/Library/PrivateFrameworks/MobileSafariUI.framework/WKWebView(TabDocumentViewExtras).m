@implementation WKWebView(TabDocumentViewExtras)

- (void)sf_setDisplayedWebViewGeometry:()TabDocumentViewExtras
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  _OWORD v13[16];

  v4 = a3[13];
  v13[12] = a3[12];
  v13[13] = v4;
  v5 = a3[15];
  v13[14] = a3[14];
  v13[15] = v5;
  v6 = a3[9];
  v13[8] = a3[8];
  v13[9] = v6;
  v7 = a3[11];
  v13[10] = a3[10];
  v13[11] = v7;
  v8 = a3[5];
  v13[4] = a3[4];
  v13[5] = v8;
  v9 = a3[7];
  v13[6] = a3[6];
  v13[7] = v9;
  v10 = a3[1];
  v13[0] = *a3;
  v13[1] = v10;
  v11 = a3[3];
  v13[2] = a3[2];
  v13[3] = v11;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v13, "{?={CGRect={CGPoint=dd}{CGSize=dd}}{UIEdgeInsets=dddd}{UIEdgeInsets=dddd}{SFScrollIndicatorInsets={UIEdgeInsets=dddd}{UIEdgeInsets=dddd}}{CGSize=dd}{CGSize=dd}{CGSize=dd}{UIEdgeInsets=dddd}Bd}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, "sf_displayedWebViewGeometry", v12, (void *)1);

}

- (void)sf_displayedWebViewGeometry
{
  void *v3;
  id v4;

  objc_getAssociatedObject(a1, "sf_displayedWebViewGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "sf_webViewGeometryValue");
  }
  else
  {
    a2[14] = 0u;
    a2[15] = 0u;
    a2[12] = 0u;
    a2[13] = 0u;
    a2[10] = 0u;
    a2[11] = 0u;
    a2[8] = 0u;
    a2[9] = 0u;
    a2[6] = 0u;
    a2[7] = 0u;
    a2[4] = 0u;
    a2[5] = 0u;
    a2[2] = 0u;
    a2[3] = 0u;
    *a2 = 0u;
    a2[1] = 0u;
  }

}

@end
