@implementation IMAVLocalPreviewClient

+ (id)sharedInstance
{
  if (qword_253DE94C0 != -1)
    dispatch_once(&qword_253DE94C0, &unk_24DA57B50);
  return (id)qword_253DE94F0;
}

- (IMAVLocalPreviewClient)init
{
  IMAVLocalPreviewClient *v2;
  AVConferencePreview *v3;
  AVConferencePreview *conferencePreview;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  AVConferencePreview *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  IMAVLocalPreviewClient *v40;
  objc_super v42;
  uint8_t buf[4];
  IMAVLocalPreviewClient *v44;
  __int16 v45;
  AVConferencePreview *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v42.receiver = self;
  v42.super_class = (Class)IMAVLocalPreviewClient;
  v2 = -[IMAVLocalPreviewClient init](&v42, sel_init);
  if (v2)
  {
    v3 = (AVConferencePreview *)objc_alloc_init((Class)MEMORY[0x219A282EC](CFSTR("AVConferencePreview"), CFSTR("AVConference")));
    conferencePreview = v2->_conferencePreview;
    v2->_conferencePreview = v3;

    objc_msgSend_setDelegate_(v2->_conferencePreview, v5, (uint64_t)v2, v6, v7);
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v2->_conferencePreview;
      *(_DWORD *)buf = 138412546;
      v44 = v2;
      v45 = 2112;
      v46 = v9;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "Setting %@ as delegate of local preview %@", buf, 0x16u);
    }

    objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v14, v15, (uint64_t)v2, (uint64_t)sel__avDaemonConnected, (uint64_t)CFSTR("__kIMAVDaemonDidConnectNotification"), 0);

    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addListener_(v20, v21, (uint64_t)v2, v22, v23);

    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActive_(v28, v29, 1, v30, v31);

    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWatchesScreenLightState_(v36, v37, 1, v38, v39);

    v40 = v2;
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v6, v7, (uint64_t)self, 0, 0);

  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeListener_(v12, v13, (uint64_t)self, v14, v15);

  objc_msgSend_conferencePreview(self, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v20, v21, 0, v22, v23);

  v24.receiver = self;
  v24.super_class = (Class)IMAVLocalPreviewClient;
  -[IMAVLocalPreviewClient dealloc](&v24, sel_dealloc);
}

- (unsigned)cameraType
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138412290;
    v36 = v8;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Querying camera type from AVConferencePreview: %@", (uint8_t *)&v35, 0xCu);

  }
  objc_msgSend_sharedInstance(IMAVInterface, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_systemSupportsBackFacingCamera(v13, v14, v15, v16, v17);

  if (!v18)
    return 0;
  objc_msgSend_conferencePreview(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localVideoAttributes(v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  sub_219017914(v28);
  v33 = objc_msgSend_camera(v28, v29, v30, v31, v32);

  return v33;
}

- (void)setCameraType:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD v27[2];
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = 67109120;
    v27[1] = v3;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Setting camera type to %d", (uint8_t *)v27, 8u);
  }

  objc_msgSend_conferencePreview(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localVideoAttributes(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setCamera_(v15, v16, v3, v17, v18);
  sub_219017914(v15);
  objc_msgSend_conferencePreview(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoAttributes_(v23, v24, (uint64_t)v15, v25, v26);

}

- (unsigned)cameraOrientation
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138412290;
    v25 = v8;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Querying camera orientation from AVConferencePreview: %@", (uint8_t *)&v24, 0xCu);

  }
  objc_msgSend_conferencePreview(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localVideoAttributes(v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  sub_219017914(v18);
  LODWORD(v13) = objc_msgSend_orientation(v18, v19, v20, v21, v22);

  return v13;
}

- (void)setCameraOrientation:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _DWORD v27[2];
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v27[0] = 67109120;
    v27[1] = v3;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Setting camera orientation to %d", (uint8_t *)v27, 8u);
  }

  objc_msgSend_conferencePreview(self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localVideoAttributes(v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setOrientation_(v15, v16, v3, v17, v18);
  sub_219017914(v15);
  objc_msgSend_conferencePreview(self, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoAttributes_(v23, v24, (uint64_t)v15, v25, v26);

}

- (void)localVideoLayer
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Querying local video layer from AVConferencePreview: %@", (uint8_t *)&v19, 0xCu);

  }
  objc_msgSend_conferencePreview(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_localVideoLayer_(v13, v14, 1, v15, v16);

  return v17;
}

- (void)setLocalVideoLayer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_conferencePreview(self, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoLayer_front_(v7, v8, (uint64_t)a3, 1, v9);

  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218242;
    v17 = a3;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Setting local video layer: %p on preview: %@", (uint8_t *)&v16, 0x16u);

  }
}

- (void)localVideoBackLayer
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Querying local video back layer from AVConferencePreview: %@", (uint8_t *)&v19, 0xCu);

  }
  objc_msgSend_conferencePreview(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend_localVideoLayer_(v13, v14, 0, v15, v16);

  return v17;
}

- (void)setLocalVideoBackLayer:(void *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_conferencePreview(self, a2, (uint64_t)a3, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalVideoLayer_front_(v7, v8, (uint64_t)a3, 0, v9);

  sub_2190076D0();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v11, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218242;
    v17 = a3;
    v18 = 2112;
    v19 = v15;
    _os_log_impl(&dword_218FEA000, v10, OS_LOG_TYPE_DEFAULT, "Setting local video back-layer: %p on preview: %@", (uint8_t *)&v16, 0x16u);

  }
}

- (id)localScreenAttributesForVideoAttributes:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v6, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138412290;
    v22 = v10;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "Querying local screen attributes from AVConferencePreview: %@", (uint8_t *)&v21, 0xCu);

  }
  objc_msgSend_conferencePreview(self, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localScreenAttributesForVideoAttributes_(v15, v16, (uint64_t)v4, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)setLocalScreenAttributes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_conferencePreview(self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLocalScreenAttributes_(v9, v10, (uint64_t)v4, v11, v12);

  sub_2190076D0();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v4;
    v21 = 2112;
    v22 = v18;
    _os_log_impl(&dword_218FEA000, v13, OS_LOG_TYPE_DEFAULT, "Setting local screen attributes: %@ on preview: %@", (uint8_t *)&v19, 0x16u);

  }
}

- (void)avChat:(id)a3 setLocalPortraitRatio:(CGSize)a4 localLandscapeRatio:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  id v10;
  objc_class *v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  void *v79;
  uint64_t v80;
  NSSize v81;
  NSSize v82;

  height = a5.height;
  width = a5.width;
  v7 = a4.height;
  v8 = a4.width;
  v80 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (objc_class *)MEMORY[0x219A282EC](CFSTR("VideoAttributes"), CFSTR("AVConference"));
  sub_2190076D0();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      v81.width = v8;
      v81.height = v7;
      NSStringFromSize(v81);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 138412290;
      v79 = v14;
      _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "Got portrait aspect ratio: %@", (uint8_t *)&v78, 0xCu);

    }
    sub_2190076D0();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v82.width = width;
      v82.height = height;
      NSStringFromSize(v82);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = 138412290;
      v79 = v16;
      _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "Got landscape aspect ratio: %@", (uint8_t *)&v78, 0xCu);

    }
    v12 = objc_alloc_init(v11);
    v17 = objc_alloc_init(v11);
    objc_msgSend_setOrientation_(v12, v18, 0, v19, v20);
    objc_msgSend_setOrientation_(v17, v21, 3, v22, v23);
    objc_msgSend_localScreenAttributesForVideoAttributes_(self, v24, (uint64_t)v12, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRatio_(v27, v28, v29, v30, v31, v8, v7);
    objc_msgSend__timings(v10, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimingForKey_(v36, v37, (uint64_t)CFSTR("setting-local-screen-attributes"), v38, v39);

    objc_msgSend_setLocalScreenAttributes_(self, v40, (uint64_t)v27, v41, v42);
    objc_msgSend__timings(v10, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTimingForKey_(v47, v48, (uint64_t)CFSTR("setting-local-screen-attributes"), v49, v50);

    objc_msgSend_localScreenAttributesForVideoAttributes_(self, v51, (uint64_t)v17, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setRatio_(v54, v55, v56, v57, v58, width, height);
    objc_msgSend__timings(v10, v59, v60, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTimingForKey_(v63, v64, (uint64_t)CFSTR("setting-local-screen-attributes"), v65, v66);

    objc_msgSend_setLocalScreenAttributes_(self, v67, (uint64_t)v54, v68, v69);
    objc_msgSend__timings(v10, v70, v71, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTimingForKey_(v74, v75, (uint64_t)CFSTR("setting-local-screen-attributes"), v76, v77);

  }
  else if (v13)
  {
    LOWORD(v78) = 0;
    _os_log_impl(&dword_218FEA000, v12, OS_LOG_TYPE_DEFAULT, "Unable to find VideoAttributes class, possibly failed to weak link AVConference.", (uint8_t *)&v78, 2u);
  }

}

+ (CGSize)localPortraitAspectRatio
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unsigned int v17;
  double v18;
  double v19;
  NSObject *v20;
  uint8_t v21[16];
  CGSize result;

  v2 = (void *)MEMORY[0x219A282EC](CFSTR("CADisplay"), CFSTR("QuartzCore"));
  if (v2)
  {
    objc_msgSend_mainDisplay(v2, v3, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bounds(v7, v8, v9, v10, v11);
    v13 = v12;
    v15 = v14;

    if (v13 <= v15)
      v16 = v13;
    else
      v16 = v15;
    if (v13 <= v15)
      v13 = v15;
    v17 = sub_219001324((int)v16, (int)v13);
    v18 = v16 / (double)v17;
    v19 = v13 / (double)v17;
  }
  else
  {
    sub_2190076D0();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_218FEA000, v20, OS_LOG_TYPE_DEFAULT, "Unable to find CADisplay class, possibly failed to weak link QuartzCore or CADisplay doesn't exist on this device.", v21, 2u);
    }

    v18 = *MEMORY[0x24BDD1410];
    v19 = *(double *)(MEMORY[0x24BDD1410] + 8);
  }
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)updateLocalScreenAtrributes
{
  NSObject *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint8_t v14[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "updateLocalScreenAtrributes was called", v14, 2u);
  }

  v4 = (void *)objc_opt_class();
  objc_msgSend_localPortraitAspectRatio(v4, v5, v6, v7, v8);
  objc_msgSend_avChat_setLocalPortraitRatio_localLandscapeRatio_(self, v9, 0, v10, v11, v12, v13, v13, v12);
}

- (BOOL)_shouldPreviewBeRunning
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL wantsPreview;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  objc_msgSend_sharedInstance(MEMORY[0x24BE50380], a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isInBackground(v6, v7, v8, v9, v10) & 1) != 0)
  {
    wantsPreview = 0;
  }
  else
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v11, v12, v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isScreenLit(v16, v17, v18, v19, v20))
      wantsPreview = self->_wantsPreview;
    else
      wantsPreview = 0;

  }
  return wantsPreview;
}

- (void)_updatePreviewState
{
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFString *v36;
  NSObject *v37;
  const __CFString *v38;
  NSObject *v39;
  const __CFString *v40;
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const __CFString *v46;
  NSObject *v47;
  const __CFString *v48;
  NSObject *v49;
  const __CFString *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int shouldPreviewBeRunning;
  NSObject *v56;
  _BOOL4 v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int isConnected;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  NSObject *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  const __CFString *v112;
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v111) = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, (uint8_t *)&v111, 2u);
  }

  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(IMAVDaemonController, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isConnected(v9, v10, v11, v12, v13))
      v14 = CFSTR("YES");
    else
      v14 = CFSTR("NO");
    v111 = 138412290;
    v112 = v14;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "         Connected to daemon: %@", (uint8_t *)&v111, 0xCu);

  }
  sub_2190076D0();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isInBackground(v20, v21, v22, v23, v24))
      v25 = CFSTR("YES");
    else
      v25 = CFSTR("NO");
    v111 = 138412290;
    v112 = v25;
    _os_log_impl(&dword_218FEA000, v15, OS_LOG_TYPE_DEFAULT, "    App is in the background: %@", (uint8_t *)&v111, 0xCu);

  }
  sub_2190076D0();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE50380], v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isScreenLit(v31, v32, v33, v34, v35))
      v36 = CFSTR("YES");
    else
      v36 = CFSTR("NO");
    v111 = 138412290;
    v112 = v36;
    _os_log_impl(&dword_218FEA000, v26, OS_LOG_TYPE_DEFAULT, "               Screen is lit: %@", (uint8_t *)&v111, 0xCu);

  }
  sub_2190076D0();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_shouldAlterPreviewState)
      v38 = CFSTR("YES");
    else
      v38 = CFSTR("NO");
    v111 = 138412290;
    v112 = v38;
    _os_log_impl(&dword_218FEA000, v37, OS_LOG_TYPE_DEFAULT, "Should we alter preview state ?: %@", (uint8_t *)&v111, 0xCu);
  }

  sub_2190076D0();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_wantsPreview)
      v40 = CFSTR("YES");
    else
      v40 = CFSTR("NO");
    v111 = 138412290;
    v112 = v40;
    _os_log_impl(&dword_218FEA000, v39, OS_LOG_TYPE_DEFAULT, "           Do we want preview ?: %@", (uint8_t *)&v111, 0xCu);
  }

  sub_2190076D0();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend__shouldPreviewBeRunning(self, v42, v43, v44, v45))
      v46 = CFSTR("YES");
    else
      v46 = CFSTR("NO");
    v111 = 138412290;
    v112 = v46;
    _os_log_impl(&dword_218FEA000, v41, OS_LOG_TYPE_DEFAULT, "    Should preview be running ?: %@", (uint8_t *)&v111, 0xCu);
  }

  sub_2190076D0();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_wantsPausedPreview)
      v48 = CFSTR("YES");
    else
      v48 = CFSTR("NO");
    v111 = 138412290;
    v112 = v48;
    _os_log_impl(&dword_218FEA000, v47, OS_LOG_TYPE_DEFAULT, "     Should preview be paused ?: %@", (uint8_t *)&v111, 0xCu);
  }

  sub_2190076D0();
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    if (self->_wantsUnpausedPreview)
      v50 = CFSTR("YES");
    else
      v50 = CFSTR("NO");
    v111 = 138412290;
    v112 = v50;
    _os_log_impl(&dword_218FEA000, v49, OS_LOG_TYPE_DEFAULT, "   Should preview be unpaused ?: %@", (uint8_t *)&v111, 0xCu);
  }

  if (self->_shouldAlterPreviewState)
  {
    shouldPreviewBeRunning = objc_msgSend__shouldPreviewBeRunning(self, v51, v52, v53, v54);
    sub_2190076D0();
    v56 = objc_claimAutoreleasedReturnValue();
    v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT);
    if (shouldPreviewBeRunning)
    {
      if (v57)
      {
        LOWORD(v111) = 0;
        _os_log_impl(&dword_218FEA000, v56, OS_LOG_TYPE_DEFAULT, "Asking daemon to start preview", (uint8_t *)&v111, 2u);
      }

      objc_msgSend_sharedInstance(IMAVDaemonController, v58, v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addListenerID_(v62, v63, (uint64_t)CFSTR("IMAVLocalPreview"), v64, v65);

      objc_msgSend_sharedInstance(IMAVDaemonController, v66, v67, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      isConnected = objc_msgSend_isConnected(v70, v71, v72, v73, v74);

      if (isConnected)
      {
        objc_msgSend_sharedInstance(IMAVDaemonController, v76, v77, v78, v79);
        v80 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_startPreview(v80, v81, v82, v83, v84);
      }
      else
      {
        sub_2190076D0();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v111) = 0;
          _os_log_impl(&dword_218FEA000, v80, OS_LOG_TYPE_DEFAULT, "*** Not connected to daemon, can't startPreview just yet ***", (uint8_t *)&v111, 2u);
        }
      }
    }
    else
    {
      if (v57)
      {
        LOWORD(v111) = 0;
        _os_log_impl(&dword_218FEA000, v56, OS_LOG_TYPE_DEFAULT, "Asking daemon to stop preview", (uint8_t *)&v111, 2u);
      }

      objc_msgSend_sharedInstance(IMAVDaemonController, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = objc_msgSend_isConnected(v89, v90, v91, v92, v93);

      if (v94)
      {
        objc_msgSend_sharedInstance(IMAVDaemonController, v95, v96, v97, v98);
        v99 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_stopPreview(v99, v100, v101, v102, v103);
      }
      else
      {
        sub_2190076D0();
        v99 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v111) = 0;
          _os_log_impl(&dword_218FEA000, v99, OS_LOG_TYPE_DEFAULT, "*** Not connected to daemon, don't need to stopPreview ***", (uint8_t *)&v111, 2u);
        }
      }

      objc_msgSend_sharedInstance(IMAVDaemonController, v104, v105, v106, v107);
      v80 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_removeListenerID_(v80, v108, (uint64_t)CFSTR("IMAVLocalPreview"), v109, v110);
    }

  }
}

- (void)_avDaemonConnected
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "*** Connected to daemon ! ***", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)startPreview
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)&self->_shouldAlterPreviewState = 257;
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "** Requesting START preview", (uint8_t *)&v14, 2u);
  }

  if (_IMWillLog())
  {
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_callStackSymbols(MEMORY[0x24BDD17F0], v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);

    }
  }
  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)stopPreview
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)&self->_shouldAlterPreviewState = 1;
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "** Requesting STOP preview", (uint8_t *)&v14, 2u);
  }

  if (_IMWillLog())
  {
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_callStackSymbols(MEMORY[0x24BDD17F0], v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);

    }
  }
  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)pausePreview
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)&self->_shouldAlterPreviewState = 65537;
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "** Requesting PAUSE preview", (uint8_t *)&v14, 2u);
  }

  if (_IMWillLog())
  {
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_callStackSymbols(MEMORY[0x24BDD17F0], v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);

    }
  }
  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)unpausePreview
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)&self->_shouldAlterPreviewState = 16777473;
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "** Requesting UN-PAUSE preview", (uint8_t *)&v14, 2u);
  }

  if (_IMWillLog())
  {
    sub_2190076D0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_callStackSymbols(MEMORY[0x24BDD17F0], v9, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_218FEA000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v14, 0xCu);

    }
  }
  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (BOOL)isPreviewRunning
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isPreviewRunning;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412290;
    v21 = v8;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Querying is preview running from AVConferencePreview: %@", (uint8_t *)&v20, 0xCu);

  }
  objc_msgSend_conferencePreview(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  isPreviewRunning = objc_msgSend_isPreviewRunning(v13, v14, v15, v16, v17);

  return isPreviewRunning;
}

- (void)beginAnimationToPIP
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Begin animation to PIP", v19, 2u);
  }

  objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend_conferencePreview(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_beginPreviewToPIPAnimation(v14, v15, v16, v17, v18);

  }
}

- (void)endAnimationToPIP
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "End animation to PIP", v19, 2u);
  }

  objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend_conferencePreview(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endPreviewToPIPAnimation(v14, v15, v16, v17, v18);

  }
}

- (void)beginAnimationToPreview
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Begin animation to preview", v19, 2u);
  }

  objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend_conferencePreview(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_beginPIPToPreviewAnimation(v14, v15, v16, v17, v18);

  }
}

- (void)endAnimationToPreview
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t v19[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "End animation to preview", v19, 2u);
  }

  objc_msgSend_conferencePreview(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    objc_msgSend_conferencePreview(self, v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endPIPToPreviewAnimation(v14, v15, v16, v17, v18);

  }
}

- (void)systemApplicationDidEnterBackground
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "App is in the background, refresh preview state", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)systemApplicationWillEnterForeground
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "App will enter the foreground, refresh preview state", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)systemScreenDidPowerUp
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Screen turned on, refreshing preview state", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)systemScreenDidPowerDown
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  sub_2190076D0();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_218FEA000, v3, OS_LOG_TYPE_DEFAULT, "Screen shut off, refreshing preview state", v8, 2u);
  }

  objc_msgSend__updatePreviewState(self, v4, v5, v6, v7);
}

- (void)didStartPreview
{
  NSObject *v2;
  uint8_t v3[16];

  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, v3, 2u);
  }

}

- (void)didStopPreview
{
  NSObject *v2;
  uint8_t buf[16];

  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, buf, 2u);
  }

  im_dispatch_after();
}

- (void)didPausePreview
{
  NSObject *v2;
  uint8_t v3[16];

  sub_2190076D0();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_218FEA000, v2, OS_LOG_TYPE_DEFAULT, (const char *)&unk_21902BCC7, v3, 2u);
  }

}

- (void)didReceiveFirstPreviewFrameFromCameraUniqueID:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "cameraUID: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)didChangeLocalVideoAttributes:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "videoAttributes: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)didChangeLocalScreenAttributes:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  sub_2190076D0();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_218FEA000, v4, OS_LOG_TYPE_DEFAULT, "videoAttributes: %@", (uint8_t *)&v5, 0xCu);
  }

}

- (void)didReceiveErrorFromCameraUniqueID:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  sub_2190076D0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_218FEA000, v7, OS_LOG_TYPE_DEFAULT, "cameraUID: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (void)cameraDidBecomeAvailableForUniqueID:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  sub_2190076D0();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_218FEA000, v5, OS_LOG_TYPE_DEFAULT, "cameraUID: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend__updatePreviewState(self, v6, v7, v8, v9);
}

- (AVConferencePreview)conferencePreview
{
  return self->_conferencePreview;
}

- (void)setConferencePreview:(id)a3
{
  objc_storeStrong((id *)&self->_conferencePreview, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conferencePreview, 0);
}

@end
