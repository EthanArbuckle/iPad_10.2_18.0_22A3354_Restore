@implementation AKAnnotationThemeBlue

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
      block[2] = sub_228FCE83C;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A261D0 != -1)
        dispatch_once(&qword_255A261D0, block);
      v3 = &qword_255A261D8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCE890;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A261E0 != -1)
        dispatch_once(&qword_255A261E0, v9);
      v3 = &qword_255A261E8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCE8E4;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A261F0 != -1)
        dispatch_once(&qword_255A261F0, v7);
      v3 = &qword_255A261F8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCE938;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26200 != -1)
        dispatch_once(&qword_255A26200, v5);
      v3 = &qword_255A26208;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCE7E8;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A261C0 != -1)
        dispatch_once(&qword_255A261C0, v13);
      v3 = &qword_255A261C8;
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
      block[2] = sub_228FCEC50;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26220 != -1)
        dispatch_once(&qword_255A26220, block);
      v3 = &qword_255A26228;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCECA4;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26230 != -1)
        dispatch_once(&qword_255A26230, v9);
      v3 = &qword_255A26238;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCECF8;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26240 != -1)
        dispatch_once(&qword_255A26240, v7);
      v3 = &qword_255A26248;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCED4C;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26250 != -1)
        dispatch_once(&qword_255A26250, v5);
      v3 = &qword_255A26258;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCEBFC;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26210 != -1)
        dispatch_once(&qword_255A26210, v13);
      v3 = &qword_255A26218;
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
      block[2] = sub_228FCF064;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26270 != -1)
        dispatch_once(&qword_255A26270, block);
      v3 = &qword_255A26278;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCF0B8;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26280 != -1)
        dispatch_once(&qword_255A26280, v9);
      v3 = &qword_255A26288;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCF10C;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26290 != -1)
        dispatch_once(&qword_255A26290, v7);
      v3 = &qword_255A26298;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCF160;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A262A0 != -1)
        dispatch_once(&qword_255A262A0, v5);
      v3 = &qword_255A262A8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCF010;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26260 != -1)
        dispatch_once(&qword_255A26260, v13);
      v3 = &qword_255A26268;
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
      block[2] = sub_228FCF478;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A262C0 != -1)
        dispatch_once(&qword_255A262C0, block);
      v3 = &qword_255A262C8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCF4CC;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A262D0 != -1)
        dispatch_once(&qword_255A262D0, v9);
      v3 = &qword_255A262D8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCF520;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A262E0 != -1)
        dispatch_once(&qword_255A262E0, v7);
      v3 = &qword_255A262E8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCF574;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A262F0 != -1)
        dispatch_once(&qword_255A262F0, v5);
      v3 = &qword_255A262F8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCF424;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A262B0 != -1)
        dispatch_once(&qword_255A262B0, v13);
      v3 = &qword_255A262B8;
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
      block[2] = sub_228FCF88C;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26310 != -1)
        dispatch_once(&qword_255A26310, block);
      v3 = &qword_255A26318;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCF8E0;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26320 != -1)
        dispatch_once(&qword_255A26320, v9);
      v3 = &qword_255A26328;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCF934;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26330 != -1)
        dispatch_once(&qword_255A26330, v7);
      v3 = &qword_255A26338;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCF988;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26340 != -1)
        dispatch_once(&qword_255A26340, v5);
      v3 = &qword_255A26348;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCF838;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26300 != -1)
        dispatch_once(&qword_255A26300, v13);
      v3 = &qword_255A26308;
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
      block[2] = sub_228FCFCA0;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26360 != -1)
        dispatch_once(&qword_255A26360, block);
      v3 = &qword_255A26368;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCFCF4;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26370 != -1)
        dispatch_once(&qword_255A26370, v9);
      v3 = &qword_255A26378;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCFD48;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26380 != -1)
        dispatch_once(&qword_255A26380, v7);
      v3 = &qword_255A26388;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCFD9C;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26390 != -1)
        dispatch_once(&qword_255A26390, v5);
      v3 = &qword_255A26398;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCFC4C;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26350 != -1)
        dispatch_once(&qword_255A26350, v13);
      v3 = &qword_255A26358;
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
      block[2] = sub_228FD00B4;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A263B0 != -1)
        dispatch_once(&qword_255A263B0, block);
      v3 = &qword_255A263B8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD0108;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A263C0 != -1)
        dispatch_once(&qword_255A263C0, v9);
      v3 = &qword_255A263C8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD015C;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A263D0 != -1)
        dispatch_once(&qword_255A263D0, v7);
      v3 = &qword_255A263D8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD01B0;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A263E0 != -1)
        dispatch_once(&qword_255A263E0, v5);
      v3 = &qword_255A263E8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD0060;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A263A0 != -1)
        dispatch_once(&qword_255A263A0, v13);
      v3 = &qword_255A263A8;
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
  block[2] = sub_228FD0278;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A263F0 != -1)
    dispatch_once(&qword_255A263F0, block);
  return byte_255A263F8;
}

- (int)annotationStyle
{
  return 2;
}

@end
