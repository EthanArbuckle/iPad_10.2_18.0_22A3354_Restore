@implementation PHVideoOverlayContentView

- (void)resetView
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHVideoOverlayContentView subviews](self, "subviews", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "removeFromSuperview");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (double)textFontSize
{
  if (qword_1002DCA78 != -1)
    dispatch_once(&qword_1002DCA78, &stru_1002867A0);
  return *(double *)&qword_1002DCA70;
}

- (double)titleFontSize
{
  if (qword_1002DCA88 != -1)
    dispatch_once(&qword_1002DCA88, &stru_1002867C0);
  return *(double *)&qword_1002DCA80;
}

@end
