@implementation ICControlCenterQuickNoteModule

- (id)launchURLForTouchType:(int64_t)a3
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  const char *v7;
  double v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BE6DDA0];
  v20 = *MEMORY[0x24BE6DD88];
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], a2, v3, v4, a3 == 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringValue(v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v11, v12, v13, v21, &v20, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_urlForQuickNoteWithOptions_(v5, v15, v16, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (void)handleTapWithTouchType:(int64_t)a3
{
  double v3;
  double v4;
  uint64_t v7;
  const char *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  double v14;
  double v15;
  const char *v16;
  double v17;
  double v18;
  const char *v19;
  double v20;
  double v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v7 = objc_msgSend_showOnLockScreen(MEMORY[0x24BE6DDE0], a2, v3, v4);
  objc_msgSend_launchURLForTouchType_(self, v8, v9, v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v13, v14, v15, MEMORY[0x24BDBD1C8], *MEMORY[0x24BE38310]);
  objc_msgSend_setObject_forKeyedSubscript_(v12, v16, v17, v18, *MEMORY[0x24BE19A30], *MEMORY[0x24BE382E0]);
  if (v7)
    objc_msgSend_setObject_forKeyedSubscript_(v12, v19, v20, v21, *MEMORY[0x24BEB0CD0], *MEMORY[0x24BEB0CE0]);
  dispatch_get_global_queue(0, 0);
  v22 = objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = sub_23101A424;
  v25[3] = &unk_24FFE25B0;
  v26 = v11;
  v27 = v12;
  v23 = v12;
  v24 = v11;
  dispatch_async(v22, v25);

}

- (id)iconGlyph
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  const char *v25;
  double v26;
  double v27;
  double v28;
  const char *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v45;
  double MinY;
  double v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  double v53;
  uint64_t v54;
  const char *v55;
  double v56;
  double v57;
  uint64_t v58;
  id v59;
  const char *v60;
  void *v61;
  id v62;
  const char *v63;
  double v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  double v69;
  void *v70;
  const char *v71;
  double v72;
  double v73;
  id v74;
  void *v75;
  _QWORD v77[4];
  id v78;
  double v79;
  double v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  objc_msgSend_configurationWithPointSize_weight_scale_(MEMORY[0x24BDF6AE0], a2, 30.0, v2, 4, -1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_traitCollection(v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_configurationWithTraitCollection_(v3, v12, v13, v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend__systemImageNamed_withConfiguration_(MEMORY[0x24BDF6AC8], v16, v17, v18, CFSTR("note.text.badge.plus"), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_size(v19, v20, v21, v22);
  v24 = v23;
  objc_msgSend_size(v19, v25, v23, v26);
  v28 = v27;
  objc_msgSend_alignmentRectInsets(v19, v29, v30, v27);
  v35 = v32 + 0.0;
  v36 = v31 + 0.0;
  v37 = v24 - (v32 + v34);
  v38 = v28 - (v31 + v33);
  if (v32 < v34)
    v32 = v34;
  if (v31 < v33)
    v31 = v33;
  v39 = -v32;
  v40 = -v31;
  v81.origin.x = v35;
  v81.origin.y = v36;
  v81.size.width = v37;
  v81.size.height = v38;
  v82 = CGRectInset(v81, v39, v40);
  x = v82.origin.x;
  y = v82.origin.y;
  width = v82.size.width;
  height = v82.size.height;
  v45 = -CGRectGetMinX(v82);
  v83.origin.x = x;
  v83.origin.y = y;
  v83.size.width = width;
  v83.size.height = height;
  MinY = CGRectGetMinY(v83);
  v47 = -MinY;
  objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], v48, MinY, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_userInterfaceLayoutDirection(v50, v51, v52, v53);

  if (v54 == 1)
  {
    objc_msgSend_imageWithHorizontallyFlippedOrientation(v19, v55, v56, v57);
    v58 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v58;
  }
  v59 = objc_alloc(MEMORY[0x24BDF6A98]);
  v61 = (void *)objc_msgSend_initWithSize_(v59, v60, width, height);
  v77[0] = MEMORY[0x24BDAC760];
  v77[1] = 3221225472;
  v77[2] = sub_23101A738;
  v77[3] = &unk_24FFE25D8;
  v78 = v19;
  v79 = v45;
  v80 = v47;
  v62 = v19;
  objc_msgSend_imageWithActions_(v61, v63, v64, v65, v77);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageWithRenderingMode_(v66, v67, v68, v69, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54 == 1)
  {
    objc_msgSend_imageWithHorizontallyFlippedOrientation(v70, v71, v72, v73);
    v74 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v74 = v70;
  }
  v75 = v74;

  return v75;
}

@end
