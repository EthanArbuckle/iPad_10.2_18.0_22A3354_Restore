@implementation MLPImageDataBatch

- (MLPImageDataBatch)initWithDataBatch:(id)a3 batchSize:(unint64_t)a4 network:(id)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  MLPImageDataBatch *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  MLPData *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  id v96;
  const char *v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  size_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  size_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  id v117;
  const char *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  NSArray *images;
  NSArray *lossLabels;
  NSArray *v125;
  NSArray *labels;
  id v128;
  void *v129;
  MLPImageDataBatch *v130;
  NSArray *v131;
  void *v132;
  NSArray *v133;
  void *v134;
  void *v136;
  void *v137;
  id v138;
  int64x2_t v139;
  uint64_t v140;
  void *v141;
  void *v142;
  uint64_t v143;
  objc_super v144;

  v7 = a3;
  v138 = a5;
  v144.receiver = self;
  v144.super_class = (Class)MLPImageDataBatch;
  v11 = -[MLPImageDataBatch init](&v144, sel_init);
  if (v11)
  {
    objc_msgSend_deviceHandler(v138, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_device(v12, v13, v14, v15);
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_layers(v138, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v19, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_layers(v138, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v27, v28, v29, v30);
    v136 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectForKeyedSubscript_(v7, v31, (uint64_t)MLPModelSampleDataFeatureValuesKey[0], v32);
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v37 = objc_msgSend_bytes(v33, v34, v35, v36);
    objc_msgSend_objectForKeyedSubscript_(v7, v38, (uint64_t)MLPModelSampleDataLabelsKey[0], v39);
    v133 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v40, a4, v41);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = v33;
    v130 = v11;
    objc_msgSend_arrayWithCapacity_(MEMORY[0x1E0C99DE8], v42, a4, v43);
    v131 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v128 = v7;
    v44 = (void *)MEMORY[0x1E0CC6E38];
    v48 = objc_msgSend_outputChannels(v136, v45, v46, v47);
    objc_msgSend_imageDescriptorWithChannelFormat_width_height_featureChannels_(v44, v49, 1, 1, 1, v48);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v53 = 0;
      do
      {
        v54 = objc_alloc_init(MLPData);
        v58 = objc_msgSend_inputLength(v23, v55, v56, v57);
        v62 = objc_msgSend_inputChannels(v23, v59, v60, v61);
        objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v63, v37 + 4 * v62 * v58 * v53, 4 * v62 * v58);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setPixels_(v54, v65, (uint64_t)v64, v66);

        objc_msgSend_deviceHandler(v138, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pixels(v54, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend_inputLength(v23, v75, v76, v77);
        v82 = objc_msgSend_inputChannels(v23, v79, v80, v81);
        objc_msgSend_imageFromData_width_height_featureChannels_(v70, v83, (uint64_t)v74, v78, 1, v82);
        v84 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_addObject_(v134, v85, (uint64_t)v84, v86);
        objc_msgSend_objectAtIndex_(v133, v87, v53, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend_unsignedIntegerValue(v89, v90, v91, v92);
        objc_msgSend_setLabel_(v54, v94, v93, v95);
        v96 = objc_alloc(MEMORY[0x1E0CC6DF0]);
        v98 = (void *)objc_msgSend_initWithDevice_imageDescriptor_(v96, v97, (uint64_t)v137, (uint64_t)v132);
        v102 = objc_msgSend_outputChannels(v136, v99, v100, v101);
        v106 = v102;
        v141 = 0;
        v142 = 0;
        v143 = 0;
        if (v102)
        {
          if ((v102 & 0x8000000000000000) != 0)
            sub_19C07DA0C();
          v107 = operator new(v102);
          v141 = v107;
          v142 = v107;
          bzero(v107, v106);
        }
        else
        {
          v107 = 0;
        }
        *((_BYTE *)v107 + objc_msgSend_unsignedIntegerValue(v89, v103, v104, v105)) = -1;
        objc_msgSend_deviceHandler(v138, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v115 = objc_msgSend_dataLayout(v111, v112, v113, v114);
        objc_msgSend_writeBytes_dataLayout_imageIndex_(v98, v116, (uint64_t)v107, v115, 0);

        v117 = objc_alloc(MEMORY[0x1E0CC6D28]);
        v139 = vdupq_n_s64(1uLL);
        v140 = 1;
        v119 = (void *)objc_msgSend_initWithDevice_lossImageSize_labelsImage_weightsImage_(v117, v118, (uint64_t)v137, (uint64_t)&v139, v98, 0);
        objc_msgSend_addObject_(v131, v120, (uint64_t)v119, v121);

        operator delete(v107);
        ++v53;
      }
      while (a4 != v53);
    }
    v122 = objc_msgSend_copy(v134, v50, v51, v52);
    v11 = v130;
    images = v130->_images;
    v130->_images = (NSArray *)v122;

    lossLabels = v130->_lossLabels;
    v130->_lossLabels = v131;
    v125 = v131;

    labels = v130->_labels;
    v130->_labels = v133;

    v7 = v128;
  }

  return v11;
}

- (NSArray)images
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setImages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)lossLabels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLossLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)labels
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_lossLabels, 0);
  objc_storeStrong((id *)&self->_images, 0);
}

@end
