@implementation AKAnnotationThemePurple

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
      block[2] = sub_228FD2304;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26650 != -1)
        dispatch_once(&qword_255A26650, block);
      v3 = &qword_255A26658;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD2358;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26660 != -1)
        dispatch_once(&qword_255A26660, v9);
      v3 = &qword_255A26668;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD23AC;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26670 != -1)
        dispatch_once(&qword_255A26670, v7);
      v3 = &qword_255A26678;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD2400;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26680 != -1)
        dispatch_once(&qword_255A26680, v5);
      v3 = &qword_255A26688;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD22B0;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26640 != -1)
        dispatch_once(&qword_255A26640, v13);
      v3 = &qword_255A26648;
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
      block[2] = sub_228FD2718;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A266A0 != -1)
        dispatch_once(&qword_255A266A0, block);
      v3 = &qword_255A266A8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD276C;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A266B0 != -1)
        dispatch_once(&qword_255A266B0, v9);
      v3 = &qword_255A266B8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD27C0;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A266C0 != -1)
        dispatch_once(&qword_255A266C0, v7);
      v3 = &qword_255A266C8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD2814;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A266D0 != -1)
        dispatch_once(&qword_255A266D0, v5);
      v3 = &qword_255A266D8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD26C4;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26690 != -1)
        dispatch_once(&qword_255A26690, v13);
      v3 = &qword_255A26698;
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
      block[2] = sub_228FD2B2C;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A266F0 != -1)
        dispatch_once(&qword_255A266F0, block);
      v3 = &qword_255A266F8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD2B80;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26700 != -1)
        dispatch_once(&qword_255A26700, v9);
      v3 = &qword_255A26708;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD2BD4;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26710 != -1)
        dispatch_once(&qword_255A26710, v7);
      v3 = &qword_255A26718;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD2C28;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26720 != -1)
        dispatch_once(&qword_255A26720, v5);
      v3 = &qword_255A26728;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD2AD8;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A266E0 != -1)
        dispatch_once(&qword_255A266E0, v13);
      v3 = &qword_255A266E8;
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
      block[2] = sub_228FD2F40;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26740 != -1)
        dispatch_once(&qword_255A26740, block);
      v3 = &qword_255A26748;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD2F94;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26750 != -1)
        dispatch_once(&qword_255A26750, v9);
      v3 = &qword_255A26758;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD2FE8;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26760 != -1)
        dispatch_once(&qword_255A26760, v7);
      v3 = &qword_255A26768;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD303C;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26770 != -1)
        dispatch_once(&qword_255A26770, v5);
      v3 = &qword_255A26778;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD2EEC;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26730 != -1)
        dispatch_once(&qword_255A26730, v13);
      v3 = &qword_255A26738;
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
      block[2] = sub_228FD3354;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26790 != -1)
        dispatch_once(&qword_255A26790, block);
      v3 = &qword_255A26798;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD33A8;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A267A0 != -1)
        dispatch_once(&qword_255A267A0, v9);
      v3 = &qword_255A267A8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD33FC;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A267B0 != -1)
        dispatch_once(&qword_255A267B0, v7);
      v3 = &qword_255A267B8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD3450;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A267C0 != -1)
        dispatch_once(&qword_255A267C0, v5);
      v3 = &qword_255A267C8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD3300;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26780 != -1)
        dispatch_once(&qword_255A26780, v13);
      v3 = &qword_255A26788;
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
      block[2] = sub_228FD3768;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A267E0 != -1)
        dispatch_once(&qword_255A267E0, block);
      v3 = &qword_255A267E8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD37BC;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A267F0 != -1)
        dispatch_once(&qword_255A267F0, v9);
      v3 = &qword_255A267F8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD3810;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26800 != -1)
        dispatch_once(&qword_255A26800, v7);
      v3 = &qword_255A26808;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD3864;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26810 != -1)
        dispatch_once(&qword_255A26810, v5);
      v3 = &qword_255A26818;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD3714;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A267D0 != -1)
        dispatch_once(&qword_255A267D0, v13);
      v3 = &qword_255A267D8;
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
      block[2] = sub_228FD3B7C;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26830 != -1)
        dispatch_once(&qword_255A26830, block);
      v3 = &qword_255A26838;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD3BD0;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26840 != -1)
        dispatch_once(&qword_255A26840, v9);
      v3 = &qword_255A26848;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD3C24;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26850 != -1)
        dispatch_once(&qword_255A26850, v7);
      v3 = &qword_255A26858;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD3C78;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26860 != -1)
        dispatch_once(&qword_255A26860, v5);
      v3 = &qword_255A26868;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD3B28;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26820 != -1)
        dispatch_once(&qword_255A26820, v13);
      v3 = &qword_255A26828;
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
  block[2] = sub_228FD3D40;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A26870 != -1)
    dispatch_once(&qword_255A26870, block);
  return byte_255A26878;
}

- (int)annotationStyle
{
  return 5;
}

@end
