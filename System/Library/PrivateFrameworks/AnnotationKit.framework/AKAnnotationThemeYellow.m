@implementation AKAnnotationThemeYellow

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
      block[2] = sub_228FD05A0;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26410 != -1)
        dispatch_once(&qword_255A26410, block);
      v3 = &qword_255A26418;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD05F4;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26420 != -1)
        dispatch_once(&qword_255A26420, v9);
      v3 = &qword_255A26428;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD0648;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26430 != -1)
        dispatch_once(&qword_255A26430, v7);
      v3 = &qword_255A26438;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD069C;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26440 != -1)
        dispatch_once(&qword_255A26440, v5);
      v3 = &qword_255A26448;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD054C;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26400 != -1)
        dispatch_once(&qword_255A26400, v13);
      v3 = &qword_255A26408;
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
      block[2] = sub_228FD09B4;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26460 != -1)
        dispatch_once(&qword_255A26460, block);
      v3 = &qword_255A26468;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD0A08;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26470 != -1)
        dispatch_once(&qword_255A26470, v9);
      v3 = &qword_255A26478;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD0A5C;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26480 != -1)
        dispatch_once(&qword_255A26480, v7);
      v3 = &qword_255A26488;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD0AB0;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26490 != -1)
        dispatch_once(&qword_255A26490, v5);
      v3 = &qword_255A26498;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD0960;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26450 != -1)
        dispatch_once(&qword_255A26450, v13);
      v3 = &qword_255A26458;
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
      block[2] = sub_228FD0DC8;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A264B0 != -1)
        dispatch_once(&qword_255A264B0, block);
      v3 = &qword_255A264B8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD0E1C;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A264C0 != -1)
        dispatch_once(&qword_255A264C0, v9);
      v3 = &qword_255A264C8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD0E70;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A264D0 != -1)
        dispatch_once(&qword_255A264D0, v7);
      v3 = &qword_255A264D8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD0EC4;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A264E0 != -1)
        dispatch_once(&qword_255A264E0, v5);
      v3 = &qword_255A264E8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD0D74;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A264A0 != -1)
        dispatch_once(&qword_255A264A0, v13);
      v3 = &qword_255A264A8;
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
      block[2] = sub_228FD11DC;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26500 != -1)
        dispatch_once(&qword_255A26500, block);
      v3 = &qword_255A26508;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD1230;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26510 != -1)
        dispatch_once(&qword_255A26510, v9);
      v3 = &qword_255A26518;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD1284;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26520 != -1)
        dispatch_once(&qword_255A26520, v7);
      v3 = &qword_255A26528;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD12D8;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26530 != -1)
        dispatch_once(&qword_255A26530, v5);
      v3 = &qword_255A26538;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD1188;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A264F0 != -1)
        dispatch_once(&qword_255A264F0, v13);
      v3 = &qword_255A264F8;
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
      block[2] = sub_228FD15F0;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26550 != -1)
        dispatch_once(&qword_255A26550, block);
      v3 = &qword_255A26558;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD1644;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26560 != -1)
        dispatch_once(&qword_255A26560, v9);
      v3 = &qword_255A26568;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD1698;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26570 != -1)
        dispatch_once(&qword_255A26570, v7);
      v3 = &qword_255A26578;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD16EC;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26580 != -1)
        dispatch_once(&qword_255A26580, v5);
      v3 = &qword_255A26588;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD159C;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26540 != -1)
        dispatch_once(&qword_255A26540, v13);
      v3 = &qword_255A26548;
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
      block[2] = sub_228FD1A04;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A265A0 != -1)
        dispatch_once(&qword_255A265A0, block);
      v3 = &qword_255A265A8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD1A58;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A265B0 != -1)
        dispatch_once(&qword_255A265B0, v9);
      v3 = &qword_255A265B8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD1AAC;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A265C0 != -1)
        dispatch_once(&qword_255A265C0, v7);
      v3 = &qword_255A265C8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD1B00;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A265D0 != -1)
        dispatch_once(&qword_255A265D0, v5);
      v3 = &qword_255A265D8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD19B0;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26590 != -1)
        dispatch_once(&qword_255A26590, v13);
      v3 = &qword_255A26598;
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
      block[2] = sub_228FD1E18;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A265F0 != -1)
        dispatch_once(&qword_255A265F0, block);
      v3 = &qword_255A265F8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FD1E6C;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26600 != -1)
        dispatch_once(&qword_255A26600, v9);
      v3 = &qword_255A26608;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FD1EC0;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26610 != -1)
        dispatch_once(&qword_255A26610, v7);
      v3 = &qword_255A26618;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FD1F14;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26620 != -1)
        dispatch_once(&qword_255A26620, v5);
      v3 = &qword_255A26628;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FD1DC4;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A265E0 != -1)
        dispatch_once(&qword_255A265E0, v13);
      v3 = &qword_255A265E8;
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
  block[2] = sub_228FD1FDC;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A26630 != -1)
    dispatch_once(&qword_255A26630, block);
  return byte_255A26638;
}

- (int)annotationStyle
{
  return 3;
}

@end
