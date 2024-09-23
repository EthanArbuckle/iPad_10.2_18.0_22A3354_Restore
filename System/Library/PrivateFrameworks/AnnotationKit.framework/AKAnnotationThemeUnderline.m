@implementation AKAnnotationThemeUnderline

- (id)noteFillColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[5];
  int v6;
  _QWORD v7[5];
  int v8;
  _QWORD v9[5];
  int v10;
  _QWORD block[5];
  int v12;
  _QWORD v13[5];
  int v14;

  switch(-[AKAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD5DCC;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26AD0 != -1)
        dispatch_once(&qword_255A26AD0, block);
      v3 = &qword_255A26AD8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD5E20;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26AE0 != -1)
        dispatch_once(&qword_255A26AE0, v9);
      v3 = &qword_255A26AE8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD5E74;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26AF0 != -1)
        dispatch_once(&qword_255A26AF0, v7);
      v3 = &qword_255A26AF8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD5EC8;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26B00 != -1)
        dispatch_once(&qword_255A26B00, v5);
      v3 = &qword_255A26B08;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD5D78;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26AC0 != -1)
        dispatch_once(&qword_255A26AC0, v13);
      v3 = &qword_255A26AC8;
LABEL_18:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)noteBorderColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[5];
  int v6;
  _QWORD v7[5];
  int v8;
  _QWORD v9[5];
  int v10;
  _QWORD block[5];
  int v12;
  _QWORD v13[5];
  int v14;

  switch(-[AKAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD61E0;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26B20 != -1)
        dispatch_once(&qword_255A26B20, block);
      v3 = &qword_255A26B28;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD6234;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26B30 != -1)
        dispatch_once(&qword_255A26B30, v9);
      v3 = &qword_255A26B38;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD6288;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26B40 != -1)
        dispatch_once(&qword_255A26B40, v7);
      v3 = &qword_255A26B48;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD62DC;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26B50 != -1)
        dispatch_once(&qword_255A26B50, v5);
      v3 = &qword_255A26B58;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD618C;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26B10 != -1)
        dispatch_once(&qword_255A26B10, v13);
      v3 = &qword_255A26B18;
LABEL_18:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)noteTextColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[5];
  int v6;
  _QWORD v7[5];
  int v8;
  _QWORD v9[5];
  int v10;
  _QWORD block[5];
  int v12;
  _QWORD v13[5];
  int v14;

  switch(-[AKAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD65F4;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26B70 != -1)
        dispatch_once(&qword_255A26B70, block);
      v3 = &qword_255A26B78;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD6648;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26B80 != -1)
        dispatch_once(&qword_255A26B80, v9);
      v3 = &qword_255A26B88;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD669C;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26B90 != -1)
        dispatch_once(&qword_255A26B90, v7);
      v3 = &qword_255A26B98;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD66F0;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26BA0 != -1)
        dispatch_once(&qword_255A26BA0, v5);
      v3 = &qword_255A26BA8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD65A0;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26B60 != -1)
        dispatch_once(&qword_255A26B60, v13);
      v3 = &qword_255A26B68;
LABEL_18:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)highlightColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[5];
  int v6;
  _QWORD v7[5];
  int v8;
  _QWORD v9[5];
  int v10;
  _QWORD block[5];
  int v12;
  _QWORD v13[5];
  int v14;

  switch(-[AKAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD6A08;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26BC0 != -1)
        dispatch_once(&qword_255A26BC0, block);
      v3 = &qword_255A26BC8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD6A5C;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26BD0 != -1)
        dispatch_once(&qword_255A26BD0, v9);
      v3 = &qword_255A26BD8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD6AB0;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26BE0 != -1)
        dispatch_once(&qword_255A26BE0, v7);
      v3 = &qword_255A26BE8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD6B04;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26BF0 != -1)
        dispatch_once(&qword_255A26BF0, v5);
      v3 = &qword_255A26BF8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD69B4;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26BB0 != -1)
        dispatch_once(&qword_255A26BB0, v13);
      v3 = &qword_255A26BB8;
LABEL_18:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)noteMarkerFillColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[5];
  int v6;
  _QWORD v7[5];
  int v8;
  _QWORD v9[5];
  int v10;
  _QWORD block[5];
  int v12;
  _QWORD v13[5];
  int v14;

  switch(-[AKAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD6E1C;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26C10 != -1)
        dispatch_once(&qword_255A26C10, block);
      v3 = &qword_255A26C18;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD6E70;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26C20 != -1)
        dispatch_once(&qword_255A26C20, v9);
      v3 = &qword_255A26C28;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD6EC4;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26C30 != -1)
        dispatch_once(&qword_255A26C30, v7);
      v3 = &qword_255A26C38;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD6F18;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26C40 != -1)
        dispatch_once(&qword_255A26C40, v5);
      v3 = &qword_255A26C48;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD6DC8;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26C00 != -1)
        dispatch_once(&qword_255A26C00, v13);
      v3 = &qword_255A26C08;
LABEL_18:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)noteMarkerBorderColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[5];
  int v6;
  _QWORD v7[5];
  int v8;
  _QWORD v9[5];
  int v10;
  _QWORD block[5];
  int v12;
  _QWORD v13[5];
  int v14;

  switch(-[AKAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD7230;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26C60 != -1)
        dispatch_once(&qword_255A26C60, block);
      v3 = &qword_255A26C68;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD7284;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26C70 != -1)
        dispatch_once(&qword_255A26C70, v9);
      v3 = &qword_255A26C78;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD72D8;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26C80 != -1)
        dispatch_once(&qword_255A26C80, v7);
      v3 = &qword_255A26C88;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD732C;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26C90 != -1)
        dispatch_once(&qword_255A26C90, v5);
      v3 = &qword_255A26C98;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD71DC;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26C50 != -1)
        dispatch_once(&qword_255A26C50, v13);
      v3 = &qword_255A26C58;
LABEL_18:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)notesSidebarBarColor
{
  uint64_t *v3;
  id result;
  _QWORD v5[5];
  int v6;
  _QWORD v7[5];
  int v8;
  _QWORD v9[5];
  int v10;
  _QWORD block[5];
  int v12;
  _QWORD v13[5];
  int v14;

  switch(-[AKAnnotationTheme pageTheme](self, "pageTheme"))
  {
    case 0:
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_228FD7644;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26CB0 != -1)
        dispatch_once(&qword_255A26CB0, block);
      v3 = &qword_255A26CB8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD7698;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26CC0 != -1)
        dispatch_once(&qword_255A26CC0, v9);
      v3 = &qword_255A26CC8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD76EC;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26CD0 != -1)
        dispatch_once(&qword_255A26CD0, v7);
      v3 = &qword_255A26CD8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD7740;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26CE0 != -1)
        dispatch_once(&qword_255A26CE0, v5);
      v3 = &qword_255A26CE8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD75F0;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26CA0 != -1)
        dispatch_once(&qword_255A26CA0, v13);
      v3 = &qword_255A26CA8;
LABEL_18:
      result = (id)*v3;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)isUnderline
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_228FD7808;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A26CF0 != -1)
    dispatch_once(&qword_255A26CF0, block);
  return byte_255A26CF8;
}

- (int)annotationStyle
{
  return 0;
}

@end
