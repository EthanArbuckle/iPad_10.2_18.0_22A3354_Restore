@implementation HRElectrocardiogramReportGenerator

- (HRElectrocardiogramReportGenerator)initWithDataSource:(id)a3
{
  id v4;
  HRElectrocardiogramReportGenerator *v5;
  HRElectrocardiogramReportGenerator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HRElectrocardiogramReportGenerator;
  v5 = -[HRElectrocardiogramReportGenerator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (id)generatePDF
{
  __CFData *v3;
  CGDataConsumer *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGContext *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  CGRect v79;

  v3 = (__CFData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v4 = CGDataConsumerCreateWithCFData(v3);
  -[HRElectrocardiogramReportGenerator _pdfMediaBox](self, "_pdfMediaBox");
  v79.origin.x = v5;
  v79.origin.y = v6;
  v79.size.width = v7;
  v79.size.height = v8;
  v9 = CGPDFContextCreate(v4, &v79, 0);
  -[HRElectrocardiogramReportGenerator setPdfContext:](self, "setPdfContext:", v9);
  CGPDFContextBeginPage(v9, 0);
  -[HRElectrocardiogramReportGenerator _nameAttributedText](self, "_nameAttributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _nameLeadingOrigin](self, "_nameLeadingOrigin");
  -[HRElectrocardiogramReportGenerator _drawAttributedText:atOrigin:leftAligned:](self, "_drawAttributedText:atOrigin:leftAligned:", v10, 1);

  -[HRElectrocardiogramReportGenerator _birthdateAttributedText](self, "_birthdateAttributedText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _birthdateLeadingOrigin](self, "_birthdateLeadingOrigin");
  -[HRElectrocardiogramReportGenerator _drawAttributedText:atOrigin:leftAligned:](self, "_drawAttributedText:atOrigin:leftAligned:", v11, 1);

  -[HRElectrocardiogramReportGenerator _sampleDateAttributedText](self, "_sampleDateAttributedText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _sampleDateTrailingOrigin](self, "_sampleDateTrailingOrigin");
  -[HRElectrocardiogramReportGenerator _drawAttributedText:atOrigin:leftAligned:](self, "_drawAttributedText:atOrigin:leftAligned:", v12, 0);

  -[HRElectrocardiogramReportGenerator _horizontalSeparatorY](self, "_horizontalSeparatorY");
  -[HRElectrocardiogramReportGenerator _drawHorizontalSeparatorAt:](self, "_drawHorizontalSeparatorAt:");
  -[HRElectrocardiogramReportGenerator descriptionTextSizeAdjustment](self, "descriptionTextSizeAdjustment");
  if (v13 < -4.0)
  {
LABEL_4:
    -[HRElectrocardiogramReportGenerator _sectionOneAttributedText](self, "_sectionOneAttributedText");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramReportGenerator _sectionOneBox](self, "_sectionOneBox");
    -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v19, 1, 0);

  }
  else
  {
    while (1)
    {
      -[HRElectrocardiogramReportGenerator _sectionOneAttributedText](self, "_sectionOneAttributedText");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRElectrocardiogramReportGenerator _sectionOneBox](self, "_sectionOneBox");
      -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v14, 1, 1);
      v16 = v15;

      if (!v16)
        break;
      -[HRElectrocardiogramReportGenerator descriptionTextSizeAdjustment](self, "descriptionTextSizeAdjustment");
      -[HRElectrocardiogramReportGenerator setDescriptionTextSizeAdjustment:](self, "setDescriptionTextSizeAdjustment:", v17 + -0.5);
      -[HRElectrocardiogramReportGenerator descriptionTextSizeAdjustment](self, "descriptionTextSizeAdjustment");
      if (v18 < -4.0)
        goto LABEL_4;
    }
  }
  -[HRElectrocardiogramReportGenerator setDescriptionTextSizeAdjustment:](self, "setDescriptionTextSizeAdjustment:", 0.0);
  -[HRElectrocardiogramReportGenerator _sectionTwoAttributedText](self, "_sectionTwoAttributedText");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _sectionTwoBox](self, "_sectionTwoBox");
  v21 = -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v20, 0, 0);
  if (v22)
  {
    v23 = v21;
    v24 = v22;
    objc_msgSend(v20, "attributedSubstringFromRange:", v21, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[HRElectrocardiogramReportGenerator _didMultilineBulletFlowIntoSectionThree:remainingRange:](self, "_didMultilineBulletFlowIntoSectionThree:remainingRange:", v20, v23, v24))
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v25);
      v27 = objc_alloc(MEMORY[0x24BDD1458]);
      -[HRElectrocardiogramReportGenerator _bulletedDescriptionTextAttributes](self, "_bulletedDescriptionTextAttributes");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v27, "initWithString:attributes:", CFSTR("\t"), v28);
      objc_msgSend(v26, "insertAttributedString:atIndex:", v29, 0);

      v30 = objc_msgSend(v26, "copy");
      v25 = (void *)v30;
    }
    -[HRElectrocardiogramReportGenerator _sectionThreeAttributedTextWithRemainingSectionTwoAttributedText:](self, "_sectionThreeAttributedTextWithRemainingSectionTwoAttributedText:", v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramReportGenerator _sectionThreeBox](self, "_sectionThreeBox");
    -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v31, 0, 0);

  }
  -[HRElectrocardiogramReportGenerator _chartRowOneGridBox](self, "_chartRowOneGridBox");
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  -[HRElectrocardiogramReportGenerator _chartRowOneAxisBox](self, "_chartRowOneAxisBox");
  -[HRElectrocardiogramReportGenerator _drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:](self, "_drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:", 0, 0, 1, v33, v35, v37, v39, v40, v41, v42, v43);
  -[HRElectrocardiogramReportGenerator _chartRowTwoGridBox](self, "_chartRowTwoGridBox");
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;
  -[HRElectrocardiogramReportGenerator _chartRowTwoAxisBox](self, "_chartRowTwoAxisBox");
  -[HRElectrocardiogramReportGenerator _drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:](self, "_drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:", 1, 10, 0, v45, v47, v49, v51, v52, v53, v54, v55);
  -[HRElectrocardiogramReportGenerator _chartRowThreeGridBox](self, "_chartRowThreeGridBox");
  v57 = v56;
  v59 = v58;
  v61 = v60;
  v63 = v62;
  -[HRElectrocardiogramReportGenerator _chartRowThreeAxisBox](self, "_chartRowThreeAxisBox");
  -[HRElectrocardiogramReportGenerator _drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:](self, "_drawElectrocardiogramChartWithWaveformPathIndex:gridRect:axisRect:axisStartingIndex:displayControlSignal:", 2, 20, 0, v57, v59, v61, v63, v64, v65, v66, v67);
  -[HRElectrocardiogramReportGenerator _footerBox](self, "_footerBox");
  v69 = v68;
  v71 = v70;
  v73 = v72;
  v75 = v74;
  -[HRElectrocardiogramReportGenerator _footerAttributedText](self, "_footerAttributedText");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:](self, "_drawAttributedText:inRect:distanceToFirstBaseline:drawHeartGlyph:mustFitInRect:", v76, 0, 0, v69, v71, v73, v75, 26.0);

  CGPDFContextEndPage(v9);
  CGContextRelease(v9);
  CGDataConsumerRelease(v4);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v3);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  return v77;
}

- (CGRect)_pdfMediaBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 792.0;
  v3 = 612.0;
  v4 = 0.0;
  v5 = 0.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_pdfCropBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = 40.0;
  v3 = 712.0;
  v4 = 532.0;
  v5 = 40.0;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v2;
  return result;
}

- (CGPoint)_nameLeadingOrigin
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  double v7;
  double v8;
  CGPoint result;
  CGRect v10;
  CGRect v11;

  -[HRElectrocardiogramReportGenerator _pdfCropBox](self, "_pdfCropBox");
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  MinX = CGRectGetMinX(v10);
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  v7 = CGRectGetMaxY(v11) + -14.0;
  v8 = MinX;
  result.y = v7;
  result.x = v8;
  return result;
}

- (CGPoint)_birthdateLeadingOrigin
{
  double v2;
  double v3;
  double v4;
  CGPoint result;

  -[HRElectrocardiogramReportGenerator _nameLeadingOrigin](self, "_nameLeadingOrigin");
  v4 = v3 + -14.0;
  result.y = v4;
  result.x = v2;
  return result;
}

- (CGPoint)_sampleDateTrailingOrigin
{
  double v3;
  double v4;
  double MaxX;
  double v6;
  CGPoint result;
  CGRect v8;

  -[HRElectrocardiogramReportGenerator _birthdateLeadingOrigin](self, "_birthdateLeadingOrigin");
  v4 = v3;
  -[HRElectrocardiogramReportGenerator _pdfCropBox](self, "_pdfCropBox");
  MaxX = CGRectGetMaxX(v8);
  v6 = v4;
  result.y = v6;
  result.x = MaxX;
  return result;
}

- (double)_horizontalSeparatorY
{
  double v2;

  -[HRElectrocardiogramReportGenerator _birthdateLeadingOrigin](self, "_birthdateLeadingOrigin");
  return v2 + -9.0;
}

- (CGRect)_sectionOneBox
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _horizontalSeparatorY](self, "_horizontalSeparatorY");
  v4 = v3;
  -[HRElectrocardiogramReportGenerator _birthdateLeadingOrigin](self, "_birthdateLeadingOrigin");
  v6 = v4 + -122.0;
  v7 = 210.0;
  v8 = 122.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_sectionTwoBox
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _horizontalSeparatorY](self, "_horizontalSeparatorY");
  v4 = v3;
  -[HRElectrocardiogramReportGenerator _sectionOneBox](self, "_sectionOneBox");
  v5 = CGRectGetMaxX(v9) + 40.0;
  v6 = v4 + -122.0;
  v7 = 210.0;
  v8 = 122.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_sectionThreeBox
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v9;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _horizontalSeparatorY](self, "_horizontalSeparatorY");
  v4 = v3;
  -[HRElectrocardiogramReportGenerator _sectionTwoBox](self, "_sectionTwoBox");
  v5 = CGRectGetMaxX(v9) + 40.0;
  v6 = v4 + -122.0;
  v7 = 210.0;
  v8 = 122.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_chartRowOneGridBox
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v6;
  double MinX;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _sectionOneBox](self, "_sectionOneBox");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  v6 = CGRectGetMinY(v11) + -20.0;
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  MinX = CGRectGetMinX(v12);
  v8 = v6 + -85.0395;
  v9 = 708.6625;
  v10 = 85.0395;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = MinX;
  return result;
}

- (CGRect)_chartRowOneAxisBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _chartRowOneGridBox](self, "_chartRowOneGridBox");
  v4 = v3 + -8.50395;
  v5 = 708.6625;
  v6 = 8.50395;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v2;
  return result;
}

- (CGRect)_chartRowTwoGridBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _chartRowOneGridBox](self, "_chartRowOneGridBox");
  v6 = v5 + -104.54345;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v2;
  return result;
}

- (CGRect)_chartRowTwoAxisBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _chartRowTwoGridBox](self, "_chartRowTwoGridBox");
  v4 = v3 + -8.50395;
  v5 = 708.6625;
  v6 = 8.50395;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v2;
  return result;
}

- (CGRect)_chartRowThreeGridBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _chartRowTwoGridBox](self, "_chartRowTwoGridBox");
  v6 = v5 + -104.54345;
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v6;
  result.origin.x = v2;
  return result;
}

- (CGRect)_chartRowThreeAxisBox
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _chartRowThreeGridBox](self, "_chartRowThreeGridBox");
  v4 = v3 + -8.50395;
  v5 = 708.6625;
  v6 = 8.50395;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v2;
  return result;
}

- (CGRect)_footerBox
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MinX;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;
  CGRect result;

  -[HRElectrocardiogramReportGenerator _chartRowThreeAxisBox](self, "_chartRowThreeAxisBox");
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  MinX = CGRectGetMinX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  v7 = CGRectGetWidth(v12);
  v8 = 0.0;
  v9 = MinX;
  v10 = y;
  result.size.height = v10;
  result.size.width = v7;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (id)_blackColorWithFraction:(double)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0 - a3);
}

- (id)_nameAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 14.0, *MEMORY[0x24BDF7890]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = *MEMORY[0x24BDF6600];
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD1458]);
  -[HRElectrocardiogramReportGenerator _nameText](self, "_nameText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v5);

  return v8;
}

- (id)_nameText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      HRUIECGLocalizedString(CFSTR("NAME_BLANK"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      return v13;
    }
  }
  v7 = objc_alloc_init(MEMORY[0x24BDD1738]);
  objc_msgSend(v7, "setStyle:", 0);
  v8 = objc_alloc_init(MEMORY[0x24BDD1730]);
  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGivenName:", v10);

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFamilyName:", v12);

  objc_msgSend(v7, "stringFromPersonNameComponents:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_birthdateAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 10.0, *MEMORY[0x24BDF7888]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = *MEMORY[0x24BDF6600];
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD1458]);
  -[HRElectrocardiogramReportGenerator _birthdateText](self, "_birthdateText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v5);

  return v8;
}

- (id)_birthdateText
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateOfBirthComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v4, "setDateStyle:", 2);
    objc_msgSend(v4, "setTimeStyle:", 0);
    objc_msgSend(v3, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    objc_msgSend(v9, "dateFromComponents:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BDD16F0]);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:toDate:options:", 4, v10, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "year"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromNumber:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    HRUIECGLocalizedString(CFSTR("DATE_OF_BIRTH_%@_AGE_%@"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v17, v11, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HRUIECGLocalizedString(CFSTR("DATE_OF_BIRTH_BLANK"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)_sampleDateAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 10.0, *MEMORY[0x24BDF7888]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v3;
  v10[1] = *MEMORY[0x24BDF6600];
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BDD1458]);
  -[HRElectrocardiogramReportGenerator _sampleDateText](self, "_sampleDateText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithString:attributes:", v7, v5);

  return v8;
}

- (id)_sampleDateText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  HKLocalizedStringForDateAndTemplateWithFormattingContext();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringForDateAndTemplateWithFormattingContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v7, "setDateStyle:", 0);
  objc_msgSend(v7, "setTimeStyle:", 1);
  objc_msgSend(v7, "setFormattingContext:", 5);
  objc_msgSend(v7, "setLocalizedDateFormatFromTemplate:", CFSTR("j"));
  objc_msgSend(v7, "stringFromDate:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invertedSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", &stru_24D34B1B8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x24BDD16F0]);
  objc_msgSend(v13, "numberFromString:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_msgSend(v14, "integerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "component:fromDate:", 32, v4);

  }
  if (v15 == 1)
    v17 = CFSTR("SAMPLE_RECORDED_DATE_TIME_SINGULAR_HOUR_%@_%@");
  else
    v17 = CFSTR("SAMPLE_RECORDED_DATE_TIME_PLURAL_HOUR_%@_%@");
  HRUIECGLocalizedString(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v5, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_sectionOneAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[HRElectrocardiogramReportGenerator _rhythmClassificationTitleText](self, "_rhythmClassificationTitleText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HRUIECGLocalizedString(CFSTR("CLASSIFICATION_AND_AVG_HEART_RATE_SEPARATOR"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRElectrocardiogramReportGenerator _averageHeartRateTitleText](self, "_averageHeartRateTitleText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HRElectrocardiogramReportGenerator setHeartGlyphPositionInFirstSectionText:](self, "setHeartGlyphPositionInFirstSectionText:", objc_msgSend(v5, "length"));
  v8 = objc_alloc_init(MEMORY[0x24BDD1688]);
  -[HRElectrocardiogramReportGenerator _sectionTitleAttributedTextWithText:](self, "_sectionTitleAttributedTextWithText:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendAttributedString:", v9);

  -[HRElectrocardiogramReportGenerator _averageHeartRateSectionTitleAttributedTextWithText:](self, "_averageHeartRateSectionTitleAttributedTextWithText:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendAttributedString:", v10);

  -[HRElectrocardiogramReportGenerator _rhythmClassificationDescriptionText](self, "_rhythmClassificationDescriptionText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _descriptionAttributedTextWithText:](self, "_descriptionAttributedTextWithText:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendAttributedString:", v12);

  v13 = (void *)objc_msgSend(v8, "copy");
  return v13;
}

- (id)_sectionTwoAttributedText
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x24BDD1688]);
  -[HRElectrocardiogramReportGenerator _symptomsDescriptionText](self, "_symptomsDescriptionText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[HRElectrocardiogramReportGenerator _symtpomsTitleText](self, "_symtpomsTitleText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingString:", CFSTR("\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramReportGenerator _sectionTitleAttributedTextWithText:](self, "_sectionTitleAttributedTextWithText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendAttributedString:", v8);

    -[HRElectrocardiogramReportGenerator _symptomsDescriptionText](self, "_symptomsDescriptionText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramReportGenerator _bulletedDescriptionAttributedTextWithBullets:](self, "_bulletedDescriptionAttributedTextWithBullets:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendAttributedString:", v10);

    v11 = (id)objc_msgSend(v3, "copy");
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDD1458]);
  }
  v12 = v11;

  return v12;
}

- (id)_sectionThreeAttributedTextWithRemainingSectionTwoAttributedText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x24BDD1688];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[HRElectrocardiogramReportGenerator _symptomsContinuedTitleText](self, "_symptomsContinuedTitleText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _sectionTitleAttributedTextWithText:](self, "_sectionTitleAttributedTextWithText:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendAttributedString:", v9);

  objc_msgSend(v6, "appendAttributedString:", v5);
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

- (id)_sectionTitleAttributedTextWithText:(id)a3
{
  void *v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v12[0] = *MEMORY[0x24BDF65F8];
  v4 = (void *)MEMORY[0x24BDF6A70];
  v5 = *MEMORY[0x24BDF7868];
  v6 = a3;
  objc_msgSend(v4, "systemFontOfSize:weight:", 10.0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = *MEMORY[0x24BDF6600];
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 1.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v6, v9);
  return v10;
}

- (id)_averageHeartRateSectionTitleAttributedTextWithText:(id)a3
{
  id v4;
  CTRunDelegateRef v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CTRunDelegateCallbacks v16;
  _QWORD v17[2];
  _QWORD v18[2];
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)&v16.version = xmmword_215491840;
  v16.getAscent = (CTRunDelegateGetAscentCallback)HeartGlyphAscent;
  v16.getDescent = (CTRunDelegateGetDescentCallback)HeartGlyphDescent;
  v16.getWidth = (CTRunDelegateGetWidthCallback)HeartGlyphWidth;
  v4 = a3;
  v5 = CTRunDelegateCreate(&v16, 0);
  v19 = *MEMORY[0x24BDC4F28];
  v20[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1, *(_OWORD *)&v16.version, v16.getAscent, v16.getDescent, v16.getWidth);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR(" "), v6);
  objc_msgSend(CFSTR(" "), "stringByAppendingString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 10.0, *MEMORY[0x24BDF7868]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v17[1] = *MEMORY[0x24BDF6600];
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 0.6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v8, v11);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v7);
  objc_msgSend(v13, "appendAttributedString:", v12);
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (id)_rhythmClassificationTitleText
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_localizedClassificationWithActiveAlgorithmVersion:", objc_msgSend(v5, "activeAlgorithmVersion"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_24D34B1B8;
  v8 = v6;

  return v8;
}

- (id)_averageHeartRateTitleText
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_localizedAverageBPM");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = &stru_24D34B1B8;
  v6 = v4;

  return v6;
}

- (id)_symtpomsTitleText
{
  return HRUIECGLocalizedString(CFSTR("SYMPTOMS_COLUMN_TITLE"));
}

- (id)_symptomsContinuedTitleText
{
  return HRUIECGLocalizedString(CFSTR("SYMPTOMS_CONTINUED_COLUMN_TITLE"));
}

- (id)_descriptionAttributedTextWithText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDF6748];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v6, "setParagraphSpacingBefore:", 5.0);
  objc_msgSend(v6, "setLineSpacing:", 3.0);
  v15[0] = *MEMORY[0x24BDF65F8];
  v7 = (void *)MEMORY[0x24BDF6A70];
  -[HRElectrocardiogramReportGenerator descriptionTextSizeAdjustment](self, "descriptionTextSizeAdjustment");
  objc_msgSend(v7, "systemFontOfSize:weight:", v8 + 10.0, *MEMORY[0x24BDF7888]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v15[1] = *MEMORY[0x24BDF6600];
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 0.6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v10;
  v15[2] = *MEMORY[0x24BDF6628];
  v11 = (void *)objc_msgSend(v6, "copy");
  v16[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v5, v12);
  return v13;
}

- (id)_bulletedDescriptionAttributedTextWithBullets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;

  v4 = a3;
  -[HRElectrocardiogramReportGenerator _bulletedDescriptionTextAttributes](self, "_bulletedDescriptionTextAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("•"), v5);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("\t"), v5);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", CFSTR("\n"), v5);
  v9 = objc_alloc_init(MEMORY[0x24BDD1688]);
  if (objc_msgSend(v4, "count"))
  {
    v10 = 0;
    do
    {
      objc_msgSend(v9, "appendAttributedString:", v6);
      objc_msgSend(v9, "appendAttributedString:", v7);
      v11 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v4, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v5);
      objc_msgSend(v9, "appendAttributedString:", v13);

      objc_msgSend(v9, "appendAttributedString:", v8);
      ++v10;
    }
    while (v10 < objc_msgSend(v4, "count"));
  }

  return v9;
}

- (id)_rhythmClassificationDescriptionText
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hrui_classificationShortBodyTextWithActiveAlgorithmVersion:isSharedData:", objc_msgSend(v5, "activeAlgorithmVersion"), 0);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = &stru_24D34B1B8;
  v8 = v6;

  return v8;
}

- (id)_symptomsDescriptionText
{
  void *v2;
  void *v3;
  void *v4;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_localizedSymptoms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_footerAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v20[0] = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 8.0, *MEMORY[0x24BDF7888]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  v20[1] = *MEMORY[0x24BDF6600];
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  HRUIECGLocalizedString(CFSTR("FOOTER_FORMAT_STRING_V2_%1$@_%2$@_%3$@_%4$@_%5$@_%6$@_%7$@_%8$@_%9$@"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x24BDD17C8];
  -[HRElectrocardiogramReportGenerator _horizontalChartResolutionText](self, "_horizontalChartResolutionText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _verticalChartResolutionText](self, "_verticalChartResolutionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _leadNameText](self, "_leadNameText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _samplingRateText](self, "_samplingRateText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _iOSVersionText](self, "_iOSVersionText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _watchOSVersionText](self, "_watchOSVersionText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _appleWatchModelText](self, "_appleWatchModelText");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _sampleAlgorithmVersionText](self, "_sampleAlgorithmVersionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HRElectrocardiogramReportGenerator _informationalText](self, "_informationalText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", v19, v5, v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v14, v18);
  return v15;
}

- (id)_horizontalChartResolutionText
{
  return HRUIECGLocalizedString(CFSTR("HORIZONTAL_CHART_RESOLUTION"));
}

- (id)_verticalChartResolutionText
{
  return HRUIECGLocalizedString(CFSTR("VERTICAL_CHART_RESOLUTION"));
}

- (id)_leadNameText
{
  return HRUIECGLocalizedString(CFSTR("LEAD_I_NAME"));
}

- (id)_samplingRateText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "samplingFrequency");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_foundationMeasurement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BDD1668]);
  HKIntegerFormatter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNumberFormatter:", v7);

  objc_msgSend(v6, "setUnitStyle:", 1);
  objc_msgSend(v6, "setUnitOptions:", 1);
  if (v5)
  {
    objc_msgSend(v6, "stringFromMeasurement:", v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_24D34B1B8;
  }

  return v8;
}

- (id)_appleWatchModelText
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hk_hfeModeEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = &stru_24D34B1B8;
  }
  else
  {
    -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hardwareVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
    }
    else
    {
      HRUIECGLocalizedString(CFSTR("UNKNOWN_WATCH_MODEL"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v5 = v11;

  }
  return v5;
}

- (id)_iOSVersionText
{
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hk_hfeModeEnabled");

  if ((v3 & 1) != 0)
  {
    v4 = &stru_24D34B1B8;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    HRUIECGLocalizedString(CFSTR("IOS_VERSION_PREFIX"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4198], "currentOSVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v7);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_sampleAlgorithmVersionText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_algorithmVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)MEMORY[0x24BDD17C8];
  HRUIECGLocalizedString(CFSTR("ALGORITHM_VERSION_PREFIX"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_watchOSVersionText
{
  void *v3;
  char v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCF50], "hk_heartRhythmDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hk_hfeModeEnabled");

  if ((v4 & 1) != 0)
  {
    v5 = &stru_24D34B1B8;
  }
  else
  {
    -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "softwareVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      HRUIECGLocalizedString(CFSTR("WATCHOS_VERSION_PREFIX"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sample");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "device");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "softwareVersion");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ %@"), v11, v15);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }
  return v5;
}

- (id)_informationalText
{
  return HRUIECGLocalizedString(CFSTR("INFORMATIONAL_TEXT"));
}

- (void)_drawHorizontalSeparatorAt:(double)a3
{
  CGContext *v5;
  id v6;
  CGContext *v7;
  CGFloat MinX;
  CGContext *v9;
  CGFloat MaxX;
  CGRect v11;
  CGRect v12;

  v5 = -[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext");
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 0.2);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v5, (CGColorRef)objc_msgSend(v6, "CGColor"));

  CGContextSetLineWidth(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), 0.5);
  CGContextBeginPath(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"));
  v7 = -[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext");
  -[HRElectrocardiogramReportGenerator _pdfCropBox](self, "_pdfCropBox");
  MinX = CGRectGetMinX(v11);
  CGContextMoveToPoint(v7, MinX, a3);
  v9 = -[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext");
  -[HRElectrocardiogramReportGenerator _pdfCropBox](self, "_pdfCropBox");
  MaxX = CGRectGetMaxX(v12);
  CGContextAddLineToPoint(v9, MaxX, a3);
  CGContextDrawPath(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), kCGPathStroke);
}

- (void)_drawAttributedText:(id)a3 atOrigin:(CGPoint)a4 leftAligned:(BOOL)a5
{
  CGFloat y;
  double x;
  const __CTLine *v9;
  const __CTLine *v10;

  y = a4.y;
  x = a4.x;
  v9 = CTLineCreateWithAttributedString((CFAttributedStringRef)a3);
  v10 = v9;
  if (!a5)
    x = x - CTLineGetTypographicBounds(v9, 0, 0, 0);
  CGContextSetTextPosition(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), x, y);
  CTLineDraw(v10, -[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"));
  CFRelease(v10);
}

- (_NSRange)_drawAttributedText:(id)a3 inRect:(CGRect)a4 distanceToFirstBaseline:(double)a5 drawHeartGlyph:(BOOL)a6 mustFitInRect:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  double height;
  CGFloat width;
  double y;
  double x;
  id v15;
  CGContext *v16;
  __int128 v17;
  const __CTFramesetter *v18;
  const CGPath *v19;
  const __CTFrame *Frame;
  const __CFArray *Lines;
  CFIndex Count;
  CGFloat v23;
  CGPathRef v24;
  CFIndex v25;
  CFIndex length;
  CFRange VisibleStringRange;
  CFIndex v28;
  CFIndex v29;
  const __CFArray *GlyphRuns;
  CFIndex v31;
  CFIndex v32;
  CFIndex v33;
  const __CTRun *v34;
  CFRange StringRange;
  double TypographicBounds;
  CGFloat v37;
  CFIndex v38;
  double OffsetForStringIndex;
  uint64_t v40;
  CGPoint *v41;
  double *p_x;
  CGFloat v43;
  CGFloat v44;
  void *v45;
  void *v46;
  void *v47;
  CGContext *v48;
  id v49;
  CGImage *v50;
  NSUInteger v51;
  NSUInteger v52;
  uint64_t v53;
  CTLineRef ValueAtIndex;
  CFIndex v55;
  CFIndex v56;
  CFIndex v57;
  CFIndex location;
  const CGPath *v59;
  const __CTFramesetter *v60;
  id v61;
  CGFloat descent;
  CGAffineTransform v63;
  uint64_t v64;
  _NSRange result;
  CFRange v66;
  CFRange v67;
  CFRange v68;
  CFRange v69;
  CFRange v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;

  v7 = a7;
  v8 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v64 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = -[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext");
  v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v63.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v63.c = v17;
  *(_OWORD *)&v63.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  CGContextSetTextMatrix(v16, &v63);
  v61 = v15;
  v18 = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)v15);
  v71.origin.x = x;
  v71.origin.y = y;
  v71.size.width = width;
  v71.size.height = height;
  v19 = CGPathCreateWithRect(v71, 0);
  v66.location = 0;
  v66.length = 0;
  Frame = CTFramesetterCreateFrame(v18, v66, v19, 0);
  Lines = CTFrameGetLines(Frame);
  Count = CFArrayGetCount(Lines);
  v60 = v18;
  if (Count < 1)
  {
    v25 = Count;
    v59 = v19;
  }
  else
  {
    *(_OWORD *)&v63.a = *MEMORY[0x24BDBEFB0];
    v67.location = 0;
    v67.length = 1;
    CTFrameGetLineOrigins(Frame, v67, (CGPoint *)&v63);
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    v23 = height - (a5 - (CGRectGetHeight(v72) - v63.b));
    CFRelease(Frame);
    CFRelease(v19);
    v73.origin.x = x;
    v73.origin.y = y;
    v73.size.width = width;
    v73.size.height = v23;
    v24 = CGPathCreateWithRect(v73, 0);
    v68.location = 0;
    v68.length = 0;
    v59 = v24;
    Frame = CTFramesetterCreateFrame(v18, v68, v24, 0);
    Lines = CTFrameGetLines(Frame);
    v25 = CFArrayGetCount(Lines);
  }
  length = CTFrameGetStringRange(Frame).length;
  VisibleStringRange = CTFrameGetVisibleStringRange(Frame);
  location = VisibleStringRange.location;
  v28 = VisibleStringRange.length;
  if (!v7 || length == VisibleStringRange.length)
  {
    CTFrameDraw(Frame, -[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"));
    if (v8 && v25 >= 1)
    {
      v29 = 0;
      v56 = VisibleStringRange.length;
      v57 = length;
      v55 = v25;
      while (1)
      {
        ValueAtIndex = (CTLineRef)CFArrayGetValueAtIndex(Lines, v29);
        GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
        v31 = CFArrayGetCount(GlyphRuns);
        if (v31 >= 1)
          break;
LABEL_14:
        ++v29;
        v28 = v56;
        length = v57;
        if (v29 >= v55)
          goto LABEL_17;
      }
      v32 = v31;
      v33 = 0;
      while (1)
      {
        v34 = (const __CTRun *)CFArrayGetValueAtIndex(GlyphRuns, v33);
        StringRange = CTRunGetStringRange(v34);
        if (StringRange.location <= -[HRElectrocardiogramReportGenerator heartGlyphPositionInFirstSectionText](self, "heartGlyphPositionInFirstSectionText")&& StringRange.location + StringRange.length > -[HRElectrocardiogramReportGenerator heartGlyphPositionInFirstSectionText](self, "heartGlyphPositionInFirstSectionText"))
        {
          break;
        }
        if (++v33 >= v32)
          goto LABEL_14;
      }
      descent = 0.0;
      v63.a = 0.0;
      v69.location = 0;
      v69.length = 0;
      TypographicBounds = CTRunGetTypographicBounds(v34, v69, &v63.a, &descent, 0);
      v37 = v63.a + descent;
      v38 = CTRunGetStringRange(v34).location;
      OffsetForStringIndex = CTLineGetOffsetForStringIndex(ValueAtIndex, v38, 0);
      MEMORY[0x24BDAC7A8]();
      v41 = (CGPoint *)(&v53 - 2 * v40);
      v70.location = 0;
      v70.length = 0;
      CTFrameGetLineOrigins(Frame, v70, v41);
      p_x = &v41[v29].x;
      v43 = OffsetForStringIndex + x + *p_x;
      v44 = y + p_x[1] - descent;
      v45 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("bpm.pdf"), v46, 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v48 = -[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext");
      v49 = objc_retainAutorelease(v47);
      v50 = (CGImage *)objc_msgSend(v49, "CGImage");
      v74.origin.x = v43;
      v74.origin.y = v44;
      v74.size.width = TypographicBounds;
      v74.size.height = v37;
      CGContextDrawImage(v48, v74, v50);

      v28 = v56;
      length = v57;
    }
  }
LABEL_17:
  CFRelease(Frame);
  CFRelease(v60);
  CFRelease(v59);

  v51 = length - v28;
  v52 = location + v28;
  result.length = v51;
  result.location = v52;
  return result;
}

- (void)_drawElectrocardiogramChartWithWaveformPathIndex:(int64_t)a3 gridRect:(CGRect)a4 axisRect:(CGRect)a5 axisStartingIndex:(int64_t)a6 displayControlSignal:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  double MaxY;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  double v49;
  id v50;
  void *v51;
  double v52;
  void *v53;
  double y;
  double width;
  _QWORD v57[4];
  id v58;
  HRElectrocardiogramReportGenerator *v59;
  _QWORD v60[4];
  id v61;
  HRElectrocardiogramReportGenerator *v62;
  CGRect v63;
  CGRect v64;

  v7 = a7;
  height = a5.size.height;
  y = a5.origin.y;
  width = a5.size.width;
  x = a5.origin.x;
  v10 = a4.size.height;
  v11 = a4.size.width;
  v12 = a4.origin.y;
  v13 = a4.origin.x;
  v16 = objc_alloc(MEMORY[0x24BE4A5F8]);
  objc_msgSend(MEMORY[0x24BE4A5F8], "printedGridOptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithGridSize:gridOptions:", v17, 2.83465, 2.83465);

  -[HRElectrocardiogramReportGenerator waveformPaths](self, "waveformPaths");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v52 = height;
    -[HRElectrocardiogramReportGenerator dataSource](self, "dataSource");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "sample");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pointsPerSecond");
    v23 = v22;
    objc_msgSend(v18, "pointsPerMillivolt");
    v27 = v26;
    v28 = 0.0;
    if (v7)
    {
      objc_msgSend(v18, "controlSignalDuration");
      v28 = v29;
    }
    LODWORD(v24) = *MEMORY[0x24BE4A030];
    LODWORD(v25) = *MEMORY[0x24BE4A028];
    objc_msgSend(v21, "hk_waveformPathsWithPointsPerSecond:pointsPerMillivolt:wrappingDuration:omittingInitialDuration:minimumValueInMillivolts:maximumValueInMillivolts:", v23, v27, 10.0, v28, v24, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HRElectrocardiogramReportGenerator setWaveformPaths:](self, "setWaveformPaths:", v30);

    height = v52;
  }
  -[HRElectrocardiogramReportGenerator waveformPaths](self, "waveformPaths");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "count") <= (unint64_t)a3)
  {
    v33 = objc_alloc_init(MEMORY[0x24BDF6870]);
  }
  else
  {
    -[HRElectrocardiogramReportGenerator waveformPaths](self, "waveformPaths");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", a3);
    v33 = (id)objc_claimAutoreleasedReturnValue();

  }
  v53 = v33;

  objc_msgSend(v18, "setWaveformPath:", v33);
  objc_msgSend(v18, "setDisplayControlSignal:", v7);
  objc_msgSend(v18, "setLineWidth:", 1.0);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.803921569, 0.0392156863, 0.125490196, 1.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineColor:", v34);

  objc_msgSend(v18, "setFrame:", v13, v12, v11, v10);
  objc_msgSend(v18, "setNeedsLayout");
  objc_msgSend(v18, "layoutIfNeeded");
  v63.origin.x = v13;
  v63.origin.y = v12;
  v63.size.width = v11;
  v63.size.height = v10;
  MaxY = CGRectGetMaxY(v63);
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __144__HRElectrocardiogramReportGenerator__drawElectrocardiogramChartWithWaveformPathIndex_gridRect_axisRect_axisStartingIndex_displayControlSignal___block_invoke;
  v60[3] = &unk_24D34ADB0;
  v61 = v18;
  v62 = self;
  v36 = v18;
  -[HRElectrocardiogramReportGenerator _drawUIKitContentAtDocumentOrigin:drawingBlock:](self, "_drawUIKitContentAtDocumentOrigin:drawingBlock:", v60, v13, MaxY);
  objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "hk_chartAxisLabelColor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "resolvedColorWithTraitCollection:", v51);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = objc_alloc(MEMORY[0x24BE4A5E0]);
  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 5.0, *MEMORY[0x24BDF7890]);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "gridOptions");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "firstObject");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "lineColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "gridOptions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "firstObject");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "lineWidth");
  v46 = (void *)objc_msgSend(v39, "initWithAxisLabelFont:axisLabelTextColor:scaleMetricsAutomatically:lineColor:lineWidth:axisLineToLabelSpacing:topBaselineMargin:bottomBaselineMargin:", v40, v38, 0, v43);

  v47 = objc_alloc(MEMORY[0x24BE4A5E8]);
  objc_msgSend(v36, "pointsPerSecond");
  v48 = (void *)objc_msgSend(v47, "initWithAxisSpacing:options:startingIndex:", v46, a6);
  objc_msgSend(v48, "setFrame:", x, y, width, height);
  objc_msgSend(v48, "setNeedsLayout");
  objc_msgSend(v48, "layoutIfNeeded");
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  v49 = CGRectGetMaxY(v64);
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __144__HRElectrocardiogramReportGenerator__drawElectrocardiogramChartWithWaveformPathIndex_gridRect_axisRect_axisStartingIndex_displayControlSignal___block_invoke_2;
  v57[3] = &unk_24D34ADB0;
  v58 = v48;
  v59 = self;
  v50 = v48;
  -[HRElectrocardiogramReportGenerator _drawUIKitContentAtDocumentOrigin:drawingBlock:](self, "_drawUIKitContentAtDocumentOrigin:drawingBlock:", v57, x, v49);

}

void __144__HRElectrocardiogramReportGenerator__drawElectrocardiogramChartWithWaveformPathIndex_gridRect_axisRect_axisStartingIndex_displayControlSignal___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderInContext:", objc_msgSend(*(id *)(a1 + 40), "pdfContext"));

}

void __144__HRElectrocardiogramReportGenerator__drawElectrocardiogramChartWithWaveformPathIndex_gridRect_axisRect_axisStartingIndex_displayControlSignal___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderInContext:", objc_msgSend(*(id *)(a1 + 40), "pdfContext"));

}

- (void)_drawUIKitContentAtDocumentOrigin:(CGPoint)a3 drawingBlock:(id)a4
{
  double y;
  double x;
  void (**v7)(_QWORD);
  CGFloat v8;

  y = a3.y;
  x = a3.x;
  v7 = (void (**)(_QWORD))a4;
  CGContextTranslateCTM(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), 0.0, 612.0);
  CGContextScaleCTM(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), 1.0, -1.0);
  v8 = 612.0 - y;
  CGContextTranslateCTM(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), x, v8);
  v7[2](v7);

  CGContextTranslateCTM(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), -x, -v8);
  CGContextScaleCTM(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), 1.0, -1.0);
  CGContextTranslateCTM(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), 0.0, -612.0);
}

- (void)_drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *v8;
  CGRect v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CGContextSetRGBStrokeColor(-[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext"), 1.0, 0.0, 0.0, 1.0);
  v8 = -[HRElectrocardiogramReportGenerator pdfContext](self, "pdfContext");
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  CGContextStrokeRectWithWidth(v8, v9, 2.0);
}

- (id)_bulletedDescriptionTextAttributes
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDF6748]);
  objc_msgSend(v3, "setParagraphSpacingBefore:", 5.0);
  objc_msgSend(v3, "setLineSpacing:", 3.0);
  objc_msgSend(v3, "setHeadIndent:", 8.0);
  v4 = objc_alloc(MEMORY[0x24BDF6780]);
  v5 = (void *)objc_msgSend(v4, "initWithTextAlignment:location:options:", 4, MEMORY[0x24BDBD1B8], 8.0);
  v14[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTabStops:", v6);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 10.0, *MEMORY[0x24BDF7888], *MEMORY[0x24BDF65F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = *MEMORY[0x24BDF6600];
  -[HRElectrocardiogramReportGenerator _blackColorWithFraction:](self, "_blackColorWithFraction:", 0.6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v12[2] = *MEMORY[0x24BDF6628];
  v9 = (void *)objc_msgSend(v3, "copy");
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)_didMultilineBulletFlowIntoSectionThree:(id)a3 remainingRange:(_NSRange)a4
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v10;

  if (!a4.length)
    return 0;
  objc_msgSend(a3, "attributedSubstringFromRange:", 0, a4.location);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("\n"), 4);
  v7 = objc_msgSend(v5, "rangeOfString:options:", CFSTR("•"), 4);
  v10 = v7 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0x7FFFFFFFFFFFFFFFLL && v7 > v6;

  return v10;
}

- (HRElectrocardiogramReportDataSource)dataSource
{
  return (HRElectrocardiogramReportDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (CGContext)pdfContext
{
  return self->_pdfContext;
}

- (void)setPdfContext:(CGContext *)a3
{
  self->_pdfContext = a3;
}

- (NSArray)waveformPaths
{
  return self->_waveformPaths;
}

- (void)setWaveformPaths:(id)a3
{
  objc_storeStrong((id *)&self->_waveformPaths, a3);
}

- (unint64_t)heartGlyphPositionInFirstSectionText
{
  return self->_heartGlyphPositionInFirstSectionText;
}

- (void)setHeartGlyphPositionInFirstSectionText:(unint64_t)a3
{
  self->_heartGlyphPositionInFirstSectionText = a3;
}

- (double)descriptionTextSizeAdjustment
{
  return self->_descriptionTextSizeAdjustment;
}

- (void)setDescriptionTextSizeAdjustment:(double)a3
{
  self->_descriptionTextSizeAdjustment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformPaths, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
