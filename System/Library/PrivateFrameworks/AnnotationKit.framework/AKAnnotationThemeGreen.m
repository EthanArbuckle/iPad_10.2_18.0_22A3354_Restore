@implementation AKAnnotationThemeGreen

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
      block[2] = sub_228FCCAD8;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A25F90 != -1)
        dispatch_once(&qword_255A25F90, block);
      v3 = &qword_255A25F98;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCCB2C;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A25FA0 != -1)
        dispatch_once(&qword_255A25FA0, v9);
      v3 = &qword_255A25FA8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCCB80;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A25FB0 != -1)
        dispatch_once(&qword_255A25FB0, v7);
      v3 = &qword_255A25FB8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCCBD4;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A25FC0 != -1)
        dispatch_once(&qword_255A25FC0, v5);
      v3 = &qword_255A25FC8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCCA84;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A25F80 != -1)
        dispatch_once(&qword_255A25F80, v13);
      v3 = &qword_255A25F88;
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
      block[2] = sub_228FCCEEC;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A25FE0 != -1)
        dispatch_once(&qword_255A25FE0, block);
      v3 = &qword_255A25FE8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCCF40;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A25FF0 != -1)
        dispatch_once(&qword_255A25FF0, v9);
      v3 = &qword_255A25FF8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCCF94;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26000 != -1)
        dispatch_once(&qword_255A26000, v7);
      v3 = &qword_255A26008;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCCFE8;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26010 != -1)
        dispatch_once(&qword_255A26010, v5);
      v3 = &qword_255A26018;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCCE98;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A25FD0 != -1)
        dispatch_once(&qword_255A25FD0, v13);
      v3 = &qword_255A25FD8;
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
      block[2] = sub_228FCD300;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26030 != -1)
        dispatch_once(&qword_255A26030, block);
      v3 = &qword_255A26038;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCD354;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26040 != -1)
        dispatch_once(&qword_255A26040, v9);
      v3 = &qword_255A26048;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCD3A8;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26050 != -1)
        dispatch_once(&qword_255A26050, v7);
      v3 = &qword_255A26058;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCD3FC;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26060 != -1)
        dispatch_once(&qword_255A26060, v5);
      v3 = &qword_255A26068;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCD2AC;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26020 != -1)
        dispatch_once(&qword_255A26020, v13);
      v3 = &qword_255A26028;
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
      block[2] = sub_228FCD714;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26080 != -1)
        dispatch_once(&qword_255A26080, block);
      v3 = &qword_255A26088;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCD768;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26090 != -1)
        dispatch_once(&qword_255A26090, v9);
      v3 = &qword_255A26098;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCD7BC;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A260A0 != -1)
        dispatch_once(&qword_255A260A0, v7);
      v3 = &qword_255A260A8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCD810;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A260B0 != -1)
        dispatch_once(&qword_255A260B0, v5);
      v3 = &qword_255A260B8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCD6C0;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26070 != -1)
        dispatch_once(&qword_255A26070, v13);
      v3 = &qword_255A26078;
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
      block[2] = sub_228FCDB28;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A260D0 != -1)
        dispatch_once(&qword_255A260D0, block);
      v3 = &qword_255A260D8;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCDB7C;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A260E0 != -1)
        dispatch_once(&qword_255A260E0, v9);
      v3 = &qword_255A260E8;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCDBD0;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A260F0 != -1)
        dispatch_once(&qword_255A260F0, v7);
      v3 = &qword_255A260F8;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCDC24;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26100 != -1)
        dispatch_once(&qword_255A26100, v5);
      v3 = &qword_255A26108;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCDAD4;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A260C0 != -1)
        dispatch_once(&qword_255A260C0, v13);
      v3 = &qword_255A260C8;
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
      block[2] = sub_228FCDF3C;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26120 != -1)
        dispatch_once(&qword_255A26120, block);
      v3 = &qword_255A26128;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCDF90;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26130 != -1)
        dispatch_once(&qword_255A26130, v9);
      v3 = &qword_255A26138;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCDFE4;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26140 != -1)
        dispatch_once(&qword_255A26140, v7);
      v3 = &qword_255A26148;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCE038;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A26150 != -1)
        dispatch_once(&qword_255A26150, v5);
      v3 = &qword_255A26158;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCDEE8;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26110 != -1)
        dispatch_once(&qword_255A26110, v13);
      v3 = &qword_255A26118;
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
      block[2] = sub_228FCE350;
      block[3] = &unk_24F1A7300;
      block[4] = self;
      v12 = 0;
      if (qword_255A26170 != -1)
        dispatch_once(&qword_255A26170, block);
      v3 = &qword_255A26178;
      goto LABEL_18;
    case 1:
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = sub_228FCE3A4;
      v9[3] = &unk_24F1A7300;
      v9[4] = self;
      v10 = 1;
      if (qword_255A26180 != -1)
        dispatch_once(&qword_255A26180, v9);
      v3 = &qword_255A26188;
      goto LABEL_18;
    case 2:
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = sub_228FCE3F8;
      v7[3] = &unk_24F1A7300;
      v7[4] = self;
      v8 = 2;
      if (qword_255A26190 != -1)
        dispatch_once(&qword_255A26190, v7);
      v3 = &qword_255A26198;
      goto LABEL_18;
    case 3:
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = sub_228FCE44C;
      v5[3] = &unk_24F1A7300;
      v5[4] = self;
      v6 = 3;
      if (qword_255A261A0 != -1)
        dispatch_once(&qword_255A261A0, v5);
      v3 = &qword_255A261A8;
      goto LABEL_18;
    case 4:
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = sub_228FCE2FC;
      v13[3] = &unk_24F1A7300;
      v13[4] = self;
      v14 = 4;
      if (qword_255A26160 != -1)
        dispatch_once(&qword_255A26160, v13);
      v3 = &qword_255A26168;
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
  block[2] = sub_228FCE514;
  block[3] = &unk_24F1A7328;
  block[4] = self;
  if (qword_255A261B0 != -1)
    dispatch_once(&qword_255A261B0, block);
  return byte_255A261B8;
}

- (int)annotationStyle
{
  return 1;
}

@end
