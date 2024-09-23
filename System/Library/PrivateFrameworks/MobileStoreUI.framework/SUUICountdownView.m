@implementation SUUICountdownView

- (SUUICountdownView)initWithCountdown:(id)a3 clientContext:(id)a4
{
  id v7;
  id v8;
  SUUICountdownView *v9;
  SUUICountdownView *v10;
  id *p_clientContext;
  id *p_countdown;
  NSNumberFormatter *v13;
  NSNumberFormatter *numberFormatter;
  NSNumberFormatter *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSOperationQueue *v24;
  NSOperationQueue *operationQueue;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  id v31;
  id location;
  objc_super v33;

  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)SUUICountdownView;
  v9 = -[SUUICountdownView init](&v33, sel_init);
  v10 = v9;
  if (v9)
  {
    p_clientContext = (id *)&v9->_clientContext;
    objc_storeStrong((id *)&v9->_clientContext, a4);
    p_countdown = (id *)&v10->_countdown;
    objc_storeStrong((id *)&v10->_countdown, a3);
    v13 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x24BDD16F0]);
    numberFormatter = v10->_numberFormatter;
    v10->_numberFormatter = v13;

    v15 = v10->_numberFormatter;
    -[SUUICountdown numberFormat](v10->_countdown, "numberFormat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[NSNumberFormatter setPositiveFormat:](v15, "setPositiveFormat:", v16);
    }
    else
    {
      if (*p_clientContext)
        objc_msgSend(*p_clientContext, "localizedStringForKey:", CFSTR("COUNTDOWN_NUMBER_FORMAT"));
      else
        +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_NUMBER_FORMAT"), 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSNumberFormatter setPositiveFormat:](v15, "setPositiveFormat:", v17);

    }
    if ((objc_msgSend(*p_countdown, "isLoaded") & 1) == 0)
    {
      objc_msgSend(*p_countdown, "URL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_initWeak(&location, v10);
        v19 = objc_alloc(MEMORY[0x24BEB2040]);
        objc_msgSend(*p_countdown, "URL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithURL:", v20);

        +[SSVURLDataConsumer consumer](SUUIJSONDataConsumer, "consumer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setDataConsumer:", v22);

        objc_msgSend(*p_clientContext, "valueForConfigurationKey:", CFSTR("sfsuffix"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setStoreFrontSuffix:", v23);

        v27 = MEMORY[0x24BDAC760];
        v28 = 3221225472;
        v29 = __53__SUUICountdownView_initWithCountdown_clientContext___block_invoke;
        v30 = &unk_2511F9E00;
        objc_copyWeak(&v31, &location);
        objc_msgSend(v21, "setOutputBlock:", &v27);
        v24 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
        operationQueue = v10->_operationQueue;
        v10->_operationQueue = v24;

        -[NSOperationQueue addOperation:](v10->_operationQueue, "addOperation:", v21, v27, v28, v29, v30);
        objc_destroyWeak(&v31);

        objc_destroyWeak(&location);
      }
    }
    -[SUUICountdownView _reload](v10, "_reload");
    -[SUUICountdownView start](v10, "start");
  }

  return v10;
}

void __53__SUUICountdownView_initWithCountdown_clientContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__SUUICountdownView_initWithCountdown_clientContext___block_invoke_2;
  block[3] = &unk_2511F5128;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v12);
}

void __53__SUUICountdownView_initWithCountdown_clientContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_setCountdownWithResponse:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)SUUICountdownView;
  -[SUUICountdownView dealloc](&v3, sel_dealloc);
}

- (void)setBackgroundImage:(id)a3
{
  id v4;
  void *v5;
  UIImageView *imageView;
  UIImageView *v7;
  UIImageView *v8;
  UIImageView *v9;
  void *v10;
  UIImageView *v11;
  id v12;

  v12 = a3;
  -[UIImageView image](self->_imageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v12;
  if (v4 != v12)
  {
    imageView = self->_imageView;
    if (v12)
    {
      if (!imageView)
      {
        v7 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
        v8 = self->_imageView;
        self->_imageView = v7;

        -[UIImageView setContentMode:](self->_imageView, "setContentMode:", 1);
        v9 = self->_imageView;
        -[SUUICountdownView backgroundColor](self, "backgroundColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIImageView setBackgroundColor:](v9, "setBackgroundColor:", v10);

        -[SUUICountdownView addSubview:](self, "addSubview:", self->_imageView);
        imageView = self->_imageView;
      }
      -[UIImageView setImage:](imageView, "setImage:");
    }
    else
    {
      -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
      v11 = self->_imageView;
      self->_imageView = 0;

    }
    -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
    v5 = v12;
  }

}

- (UIImage)backgroundImage
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)start
{
  double v3;
  uint64_t v4;
  SUUICountdownViewTimerTarget *timerTarget;
  SUUICountdownViewTimerTarget *v6;
  SUUICountdownViewTimerTarget *v7;
  SUUICountdownViewTimerTarget *v8;
  NSTimer *v9;
  NSTimer *timer;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  if (-[SUUICountdown isLoaded](self->_countdown, "isLoaded"))
  {
    -[NSTimer invalidate](self->_timer, "invalidate");
    v3 = 1.0;
    if (!-[SUUICountdown type](self->_countdown, "type"))
    {
      v4 = -[SUUICountdown rate](self->_countdown, "rate");
      if (1.0 / (double)v4 >= 0.400000006)
        v3 = 1.0 / (double)v4;
      else
        v3 = 0.400000006;
    }
    timerTarget = self->_timerTarget;
    if (!timerTarget)
    {
      objc_initWeak(&location, self);
      v6 = objc_alloc_init(SUUICountdownViewTimerTarget);
      v7 = self->_timerTarget;
      self->_timerTarget = v6;

      v8 = self->_timerTarget;
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __26__SUUICountdownView_start__block_invoke;
      v15 = &unk_2511F53F8;
      objc_copyWeak(&v16, &location);
      -[SUUICountdownViewTimerTarget setActionBlock:](v8, "setActionBlock:", &v12);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      timerTarget = self->_timerTarget;
    }
    objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", timerTarget, sel_action, 0, 1, v3, v12, v13, v14, v15);
    v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    timer = self->_timer;
    self->_timer = v9;

    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addTimer:forMode:", self->_timer, *MEMORY[0x24BDBCB80]);

  }
}

void __26__SUUICountdownView_start__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reload");

}

- (void)stop
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)setFrame:(CGRect)a3
{
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUICountdownView;
  -[SUUICountdownView setFrame:](&v5, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SUUICountdownView frame](self, "frame");
  self->_factor = v4 / 212.0;
  -[SUUICountdownView _reloadFontSizes](self, "_reloadFontSizes");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;
  double v16;
  float v17;
  int64_t v18;
  SUUICountdown *countdown;
  _BOOL4 v20;
  UILabel *dateDescriptionLabelDay;
  UILabel *dateDescriptionLabelHour;
  UILabel *dateDescriptionLabelSecond;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  uint64_t i;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t j;
  double v36;
  void *v37;
  float v38;
  unint64_t v39;
  double v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  double v46;
  float v47;
  UILabel *numberLabel;
  double v49;
  double v50;
  float v51;
  void *v52;
  UILabel *v53;
  void *v54;
  UILabel *dateDescriptionLabelMinute;
  void *v56;
  UILabel *v57;
  void *v58;
  void *v59;
  UILabel *dateLabelDay;
  uint64_t v61;
  UILabel *dateLabelHour;
  void *v63;
  UILabel *dateLabelMinute;
  void *v65;
  UILabel *dateLabelSecond;
  void *v67;
  void *v68;
  void *v69;
  unint64_t v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  float v79;
  void *v80;
  double v81;
  unint64_t v82;
  float v83;
  double v84;
  float v85;
  double v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t n;
  void *v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  float v98;
  double factor;
  unint64_t v100;
  float v101;
  float v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  double v110;
  double v111;
  float v112;
  float v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t k;
  void *v119;
  double v120;
  double v121;
  double v122;
  double v123;
  CGFloat MinY;
  double v125;
  float v126;
  double v127;
  float v128;
  double v129;
  unint64_t v130;
  float v131;
  float v132;
  double v133;
  double v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  float v143;
  float v144;
  double v145;
  double v146;
  double v147;
  double v148;
  float v149;
  double v150;
  CGFloat v151;
  double v152;
  float v153;
  CGFloat v154;
  float v155;
  uint64_t v156;
  void *v157;
  NSMutableArray *obj;
  void *v159;
  void *v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  objc_super v181;
  _QWORD v182[4];
  _QWORD v183[4];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _QWORD v187[4];
  _BYTE v188[128];
  _BYTE v189[128];
  uint64_t v190;
  CGRect v191;
  CGRect v192;

  v190 = *MEMORY[0x24BDAC8D0];
  v181.receiver = self;
  v181.super_class = (Class)SUUICountdownView;
  -[SUUICountdownView layoutSubviews](&v181, sel_layoutSubviews);
  -[SUUICountdownView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_imageView)
  {
    -[SUUICountdownView sendSubviewToBack:](self, "sendSubviewToBack:");
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v4, v6, v8, v10);
  }
  if (-[SUUICountdown isLoaded](self->_countdown, "isLoaded"))
  {
    -[SUUICountdown artworkProvider](self->_countdown, "artworkProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[SUUICountdown artworkProvider](self->_countdown, "artworkProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "largestArtwork");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = v8 / (double)objc_msgSend(v13, "width");
      v15 = objc_msgSend(v13, "height");
      v16 = v14 * (double)v15;
      if (v16 > 0.0)
      {
        v17 = (v10 - v16) * 0.5;
        v6 = v6 + roundf(v17);
        v10 = v14 * (double)v15;
      }

    }
    v18 = -[SUUICountdown type](self->_countdown, "type");
    countdown = self->_countdown;
    if (v18)
    {
      if (-[SUUICountdown type](countdown, "type") != 1)
        return;
      v20 = -[SUUICountdown isFlapped](self->_countdown, "isFlapped");
      dateDescriptionLabelDay = self->_dateDescriptionLabelDay;
      if (v20)
      {
        dateDescriptionLabelHour = self->_dateDescriptionLabelHour;
        v187[0] = self->_dateDescriptionLabelDay;
        v187[1] = dateDescriptionLabelHour;
        dateDescriptionLabelSecond = self->_dateDescriptionLabelSecond;
        v187[2] = self->_dateDescriptionLabelMinute;
        v187[3] = dateDescriptionLabelSecond;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v187, 4);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v169 = 0u;
        v170 = 0u;
        v171 = 0u;
        v172 = 0u;
        v156 = 512;
        obj = self->_dateFlapLabels;
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v169, v186, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v170;
          v27 = 0.0;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v170 != v26)
                objc_enumerationMutation(obj);
              v29 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
              v165 = 0u;
              v166 = 0u;
              v167 = 0u;
              v168 = 0u;
              v30 = v29;
              v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v165, v185, 16);
              if (v31)
              {
                v32 = v31;
                v33 = *(_QWORD *)v166;
                v34 = 0.0;
                do
                {
                  for (j = 0; j != v32; ++j)
                  {
                    if (*(_QWORD *)v166 != v33)
                      objc_enumerationMutation(v30);
                    objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * j), "frame", v156);
                    v34 = v34 + v36;
                  }
                  v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v165, v185, 16);
                }
                while (v32);
              }
              else
              {
                v34 = 0.0;
              }

              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27 + v34 * 0.5);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v159, "addObject:", v37);

              v38 = self->_factor * 7.0;
              v27 = v27 + v34 + roundf(v38);
            }
            v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v169, v186, 16);
          }
          while (v25);
        }
        else
        {
          v27 = 0.0;
        }

        factor = self->_factor;
        v59 = v157;
        if (objc_msgSend(v157, "count"))
        {
          v100 = 0;
          v101 = factor * 7.0;
          v102 = factor * 6.0;
          v103 = v10 + v6 - roundf(v102);
          v104 = floor((v8 - (v27 - roundf(v101))) * 0.5);
          v105 = v104;
          do
          {
            objc_msgSend(v59, "objectAtIndex:", v100, v156);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v159, "objectAtIndex:", v100);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "frame");
            v109 = v108;
            v111 = v110;
            objc_msgSend(v107, "floatValue");
            v113 = self->_factor * 4.0;
            objc_msgSend(v106, "setFrame:", floor(v104 + v112 + v109 * -0.5), v103 - v111 - roundf(v113), v109, v111);
            objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v156), "objectAtIndex:", v100);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v161 = 0u;
            v162 = 0u;
            v163 = 0u;
            v164 = 0u;
            v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v161, v184, 16);
            if (v115)
            {
              v116 = v115;
              v117 = *(_QWORD *)v162;
              do
              {
                for (k = 0; k != v116; ++k)
                {
                  if (*(_QWORD *)v162 != v117)
                    objc_enumerationMutation(v114);
                  v119 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * k);
                  objc_msgSend(v119, "frame");
                  v121 = v120;
                  v123 = v122;
                  objc_msgSend(v106, "frame");
                  MinY = CGRectGetMinY(v191);
                  v125 = self->_factor;
                  v126 = v125 * 4.0;
                  *(float *)&v125 = v125 * 5.0;
                  objc_msgSend(v119, "setFrame:", v105, MinY + roundf(v126) - roundf(*(float *)&v125) - v123, v121, v123);
                  objc_msgSend(v119, "frame");
                  v105 = v105 + v127;
                }
                v116 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v161, v184, 16);
              }
              while (v116);
            }
            v128 = self->_factor * 7.0;
            v105 = v105 + roundf(v128);

            ++v100;
            v59 = v157;
          }
          while (v100 < objc_msgSend(v157, "count"));
        }

LABEL_116:
        return;
      }
      v52 = self->_dateDescriptionLabelDay;
      if (!dateDescriptionLabelDay)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v183[0] = v52;
      v53 = self->_dateDescriptionLabelHour;
      v54 = v53;
      if (!v53)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v183[1] = v54;
      dateDescriptionLabelMinute = self->_dateDescriptionLabelMinute;
      v56 = dateDescriptionLabelMinute;
      if (!dateDescriptionLabelMinute)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v183[2] = v56;
      v57 = self->_dateDescriptionLabelSecond;
      v58 = v57;
      if (!v57)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v183[3] = v58;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v183, 4);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v57)

      if (!dateDescriptionLabelMinute)
      if (!v53)

      if (!dateDescriptionLabelDay)
      dateLabelDay = self->_dateLabelDay;
      v61 = (uint64_t)dateLabelDay;
      if (!dateLabelDay)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v61 = objc_claimAutoreleasedReturnValue();
      }
      v160 = (void *)v61;
      v182[0] = v61;
      dateLabelHour = self->_dateLabelHour;
      v63 = dateLabelHour;
      if (!dateLabelHour)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v182[1] = v63;
      dateLabelMinute = self->_dateLabelMinute;
      v65 = dateLabelMinute;
      if (!dateLabelMinute)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v182[2] = v65;
      dateLabelSecond = self->_dateLabelSecond;
      v67 = dateLabelSecond;
      if (!dateLabelSecond)
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v182[3] = v67;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v182, 4);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (dateLabelSecond)
      {
        if (dateLabelMinute)
          goto LABEL_68;
      }
      else
      {

        if (dateLabelMinute)
        {
LABEL_68:
          if (dateLabelHour)
            goto LABEL_69;
          goto LABEL_107;
        }
      }

      if (dateLabelHour)
      {
LABEL_69:
        if (dateLabelDay)
        {
LABEL_70:
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v59, "count"))
          {
            v70 = 0;
            v71 = 0.0;
            do
            {
              objc_msgSend(v59, "objectAtIndex:", v70);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "objectAtIndex:", v70);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v74 = (void *)objc_claimAutoreleasedReturnValue();

              if (v73 == v74)
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "addObject:", v80);

              }
              else
              {
                objc_msgSend(v72, "frame");
                v76 = v75;
                objc_msgSend(v73, "frame");
                if (v76 < v77 + -5.0)
                  v76 = v77 + -5.0;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v71 + v76 * 0.5);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v69, "addObject:", v78);

                v79 = self->_factor * 14.0;
                v71 = v71 + v76 + roundf(v79);
              }

              ++v70;
            }
            while (v70 < objc_msgSend(v59, "count"));
          }
          else
          {
            v71 = 0.0;
          }
          v129 = self->_factor;
          if (objc_msgSend(v59, "count"))
          {
            v130 = 0;
            v131 = v129 * 14.0;
            v132 = v129 * 8.0;
            v133 = v10 + v6 - roundf(v132);
            v134 = floor((v8 - (v71 - roundf(v131))) * 0.5);
            do
            {
              objc_msgSend(v59, "objectAtIndex:", v130);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "objectAtIndex:", v130);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "objectAtIndex:", v130);
              v137 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCEF8], "null");
              v138 = (void *)objc_claimAutoreleasedReturnValue();

              if (v136 != v138)
              {
                objc_msgSend(v135, "frame");
                v140 = v139;
                v142 = v141;
                objc_msgSend(v137, "floatValue");
                v144 = self->_factor * 4.0;
                objc_msgSend(v135, "setFrame:", floor(v134 + v143 - v140 * 0.5), v133 - v142 - roundf(v144), v140, v142);
                objc_msgSend(v136, "frame");
                v146 = v145;
                v148 = v147;
                objc_msgSend(v137, "floatValue");
                v150 = floor(v134 + v149 - v146 * 0.5);
                objc_msgSend(v135, "frame");
                v151 = CGRectGetMinY(v192);
                v152 = self->_factor;
                v153 = v152 * 4.0;
                v154 = v151 + roundf(v153);
                v155 = v152 * 5.0;
                *(float *)&v152 = v152 * 7.0;
                objc_msgSend(v136, "setFrame:", v150, v154 - roundf(v155) - v148 + roundf(*(float *)&v152), v146, v148);
              }

              ++v130;
            }
            while (v130 < objc_msgSend(v59, "count"));
          }

          goto LABEL_116;
        }
LABEL_108:

        goto LABEL_70;
      }
LABEL_107:

      if (dateLabelDay)
        goto LABEL_70;
      goto LABEL_108;
    }
    if (-[SUUICountdown isFlapped](countdown, "isFlapped"))
    {
      if (-[NSMutableArray count](self->_numberFlapLabels, "count"))
      {
        v39 = 0;
        v40 = 0.0;
        do
        {
          -[NSMutableArray objectAtIndex:](self->_numberFlapLabels, "objectAtIndex:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v177 = 0u;
          v178 = 0u;
          v179 = 0u;
          v180 = 0u;
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v177, v189, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v178;
            do
            {
              for (m = 0; m != v43; ++m)
              {
                if (*(_QWORD *)v178 != v44)
                  objc_enumerationMutation(v41);
                objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * m), "frame");
                v40 = v40 + v46;
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v177, v189, 16);
            }
            while (v43);
          }
          v47 = self->_factor * 7.0;
          v40 = v40 + roundf(v47);

          ++v39;
        }
        while (v39 < -[NSMutableArray count](self->_numberFlapLabels, "count"));
      }
      else
      {
        v40 = 0.0;
      }
      v81 = self->_factor;
      if (-[NSMutableArray count](self->_numberFlapLabels, "count"))
      {
        v82 = 0;
        v83 = v81 * 8.0;
        v84 = v10 + v6 - roundf(v83);
        v85 = v81 * 7.0;
        v86 = floor((v8 - (v40 - roundf(v85))) * 0.5);
        do
        {
          -[NSMutableArray objectAtIndex:](self->_numberFlapLabels, "objectAtIndex:", v82);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v173 = 0u;
          v174 = 0u;
          v175 = 0u;
          v176 = 0u;
          v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v173, v188, 16);
          if (v88)
          {
            v89 = v88;
            v90 = *(_QWORD *)v174;
            do
            {
              for (n = 0; n != v89; ++n)
              {
                if (*(_QWORD *)v174 != v90)
                  objc_enumerationMutation(v87);
                v92 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * n);
                objc_msgSend(v92, "frame");
                v94 = v93;
                objc_msgSend(v92, "setFrame:", v86, v84 - v95);
                v86 = v86 + v94;
              }
              v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v173, v188, 16);
            }
            while (v89);
          }
          if (-[NSMutableArray count](self->_numberSeparatorLabels, "count") > v82)
          {
            -[NSMutableArray objectAtIndex:](self->_numberSeparatorLabels, "objectAtIndex:", v82);
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "frame");
            objc_msgSend(v96, "setFrame:", v86, v84 - v97 + 5.0);

          }
          v98 = self->_factor * 7.0;
          v86 = v86 + roundf(v98);

          ++v82;
        }
        while (v82 < -[NSMutableArray count](self->_numberFlapLabels, "count"));
      }
    }
    else
    {
      numberLabel = self->_numberLabel;
      if (numberLabel)
      {
        -[UILabel sizeToFit](numberLabel, "sizeToFit");
        -[UILabel frame](self->_numberLabel, "frame");
        v50 = self->_factor;
        v51 = v50 * 12.0;
        *(float *)&v50 = v50 * 7.0;
        -[UILabel setFrame:](self->_numberLabel, "setFrame:", v4, v10 + v6 - v49 - roundf(v51) + roundf(*(float *)&v50), v8);
      }
    }
  }
}

- (id)_newDateLabel
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[SUUICountdown fontColor](self->_countdown, "fontColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v4);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v5);

  objc_msgSend(v3, "setTextAlignment:", 1);
  return v3;
}

- (id)_newFlapLabelWithPosition:(int64_t)a3
{
  void *v5;
  void *v6;
  SUUICountdownFlapView *v7;
  void *v8;
  void *v9;

  -[SUUICountdown flapTopColor](self->_countdown, "flapTopColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICountdown flapBottomColor](self->_countdown, "flapBottomColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUUICountdownFlapView initWithPosition:flapTopColor:flapBottomColor:]([SUUICountdownFlapView alloc], "initWithPosition:flapTopColor:flapBottomColor:", a3, v5, v6);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICountdownFlapView setBackgroundColor:](v7, "setBackgroundColor:", v8);

  -[SUUICountdown fontColor](self->_countdown, "fontColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICountdownFlapView setTextColor:](v7, "setTextColor:", v9);

  return v7;
}

- (id)_newDateDescriptionLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[SUUICountdown fontColor](self->_countdown, "fontColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setTextColor:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v5);

  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  objc_msgSend(v3, "setTextAlignment:", 1);
  return v3;
}

- (id)_newNumberSeparatorLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BEBD708]);
  -[SUUICountdown flapTopColor](self->_countdown, "flapTopColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setTextColor:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTextColor:", v5);

  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v6);

  objc_msgSend(v3, "setTextAlignment:", 1);
  return v3;
}

- (void)_reload
{
  int64_t v3;
  SUUICountdown *countdown;
  SUUICountdownView *v5;
  uint64_t v6;

  if (-[SUUICountdown isLoaded](self->_countdown, "isLoaded"))
  {
    v3 = -[SUUICountdown type](self->_countdown, "type");
    countdown = self->_countdown;
    if (v3)
    {
      if (-[SUUICountdown type](countdown, "type") == 1)
      {
        if (-[SUUICountdown isFlapped](self->_countdown, "isFlapped"))
        {
          -[SUUICountdownView _reloadTimeFlapped](self, "_reloadTimeFlapped");
          v5 = self;
          v6 = 0;
        }
        else
        {
          -[SUUICountdownView _reloadTime](self, "_reloadTime");
          v5 = self;
          v6 = 1;
        }
        -[SUUICountdownView _reloadDateDescriptions:](v5, "_reloadDateDescriptions:", v6);
      }
    }
    else if (-[SUUICountdown isFlapped](countdown, "isFlapped"))
    {
      -[SUUICountdownView _reloadNumberFlapped](self, "_reloadNumberFlapped");
    }
    else
    {
      -[SUUICountdownView _reloadNumber](self, "_reloadNumber");
    }
  }
}

- (void)_reloadNumber
{
  UILabel *v3;
  UILabel *numberLabel;
  UILabel *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  NSNumberFormatter *numberFormatter;
  void *v11;
  id v12;

  if (!self->_numberLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    numberLabel = self->_numberLabel;
    self->_numberLabel = v3;

    v5 = self->_numberLabel;
    -[SUUICountdown fontColor](self->_countdown, "fontColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[UILabel setTextColor:](v5, "setTextColor:", v6);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v5, "setTextColor:", v7);

    }
    v8 = self->_numberLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v8, "setBackgroundColor:", v9);

    -[UILabel setTextAlignment:](self->_numberLabel, "setTextAlignment:", 1);
    -[SUUICountdownView addSubview:](self, "addSubview:", self->_numberLabel);
    -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
  }
  numberFormatter = self->_numberFormatter;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[SUUICountdownView _currentValue](self, "_currentValue"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](numberFormatter, "stringFromNumber:", v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[UILabel setText:](self->_numberLabel, "setText:", v12);
}

- (void)_reloadNumberFlapped
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *numberSeparatorLabels;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  NSMutableArray *numberFlapLabels;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v44;
  void *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  if (!self->_numberFlapLabels)
  {
    -[NSNumberFormatter positiveFormat](self->_numberFormatter, "positiveFormat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("#"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BDBCEB8];
    v44 = (void *)v4;
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "removeObject:", &stru_2511FF0C8);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    numberSeparatorLabels = self->_numberSeparatorLabels;
    self->_numberSeparatorLabels = v8;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    obj = v7;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v52 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v15 = -[SUUICountdownView _newNumberSeparatorLabel](self, "_newNumberSeparatorLabel");
          objc_msgSend(v15, "setText:", v14);
          objc_msgSend(v15, "sizeToFit");
          -[SUUICountdownView addSubview:](self, "addSubview:", v15);
          -[NSMutableArray addObject:](self->_numberSeparatorLabels, "addObject:", v15);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v11);
    }

    objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("#"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invertedSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = v3;
    objc_msgSend(v3, "componentsSeparatedByCharactersInSet:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    numberFlapLabels = self->_numberFlapLabels;
    self->_numberFlapLabels = v19;

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v48 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v26, "length"))
          {
            v28 = 0;
            do
            {
              if (objc_msgSend(v26, "length") == 1)
              {
                v29 = 3;
              }
              else if (v28)
              {
                if (v28 == objc_msgSend(v26, "length") - 1)
                  v29 = 2;
                else
                  v29 = 1;
              }
              else
              {
                v29 = 0;
              }
              v30 = -[SUUICountdownView _newFlapLabelWithPosition:](self, "_newFlapLabelWithPosition:", v29);
              -[SUUICountdownView addSubview:](self, "addSubview:", v30);
              objc_msgSend(v27, "addObject:", v30);

              ++v28;
            }
            while (v28 < objc_msgSend(v26, "length"));
          }
          -[NSMutableArray addObject:](self->_numberFlapLabels, "addObject:", v27);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v23);
    }

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lld"), -[SUUICountdownView _currentValue](self, "_currentValue"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v31, "length"))
  {
    v33 = 0;
    do
    {
      objc_msgSend(v31, "substringWithRange:", v33, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v34);

      ++v33;
    }
    while (v33 < objc_msgSend(v31, "length"));
  }
  objc_msgSend(v32, "reverseObjectEnumerator");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = -[NSMutableArray count](self->_numberFlapLabels, "count") - 1;
  if (v36 >= 0)
  {
    do
    {
      -[NSMutableArray objectAtIndex:](self->_numberFlapLabels, "objectAtIndex:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count") - 1;
      if (v38 >= 0)
      {
        do
        {
          objc_msgSend(v37, "objectAtIndex:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "nextObject");
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = (void *)v40;
          if (v40)
            v42 = (const __CFString *)v40;
          else
            v42 = CFSTR("0");
          objc_msgSend(v39, "setString:", v42);

          --v38;
        }
        while (v38 != -1);
      }

    }
    while (v36-- > 0);
  }

}

- (void)_reloadDateDescriptions:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  UILabel *dateDescriptionLabelDay;
  BOOL v7;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  SUUIClientContext *clientContext;
  UILabel *v12;
  void *v13;
  char v14;
  UILabel *dateDescriptionLabelHour;
  UILabel *v16;
  UILabel *v17;
  UILabel *v18;
  SUUIClientContext *v19;
  UILabel *v20;
  void *v21;
  char v22;
  UILabel *dateDescriptionLabelMinute;
  UILabel *v24;
  UILabel *v25;
  UILabel *v26;
  SUUIClientContext *v27;
  UILabel *v28;
  void *v29;
  char v30;
  UILabel *dateDescriptionLabelSecond;
  UILabel *v32;
  UILabel *v33;
  UILabel *v34;
  SUUIClientContext *v35;
  UILabel *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;

  v3 = a3;
  v40 = 0uLL;
  v38 = 0;
  v39 = 0;
  -[SUUICountdownView _currentRemainingDays:hours:minutes:seconds:](self, "_currentRemainingDays:hours:minutes:seconds:", (char *)&v40 + 8, &v40, &v39, &v38);
  v5 = !v3;
  dateDescriptionLabelDay = self->_dateDescriptionLabelDay;
  if (*((_QWORD *)&v40 + 1))
    v7 = 1;
  else
    v7 = !v3;
  if (v7)
  {
    if (dateDescriptionLabelDay)
      goto LABEL_14;
    v8 = -[SUUICountdownView _newDateDescriptionLabel](self, "_newDateDescriptionLabel");
    v9 = self->_dateDescriptionLabelDay;
    self->_dateDescriptionLabelDay = v8;

    v10 = self->_dateDescriptionLabelDay;
    clientContext = self->_clientContext;
    if (clientContext)
      -[SUUIClientContext localizedStringForKey:](clientContext, "localizedStringForKey:", CFSTR("COUNTDOWN_DAYS"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_DAYS"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10, "setText:", v13);

    -[UILabel sizeToFit](self->_dateDescriptionLabelDay, "sizeToFit");
    -[SUUICountdownView addSubview:](self, "addSubview:", self->_dateDescriptionLabelDay);
  }
  else
  {
    if (!dateDescriptionLabelDay)
      goto LABEL_14;
    -[UILabel removeFromSuperview](dateDescriptionLabelDay, "removeFromSuperview");
    v12 = self->_dateDescriptionLabelDay;
    self->_dateDescriptionLabelDay = 0;

  }
  -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
LABEL_14:
  if (v40 == 0)
    v14 = v5;
  else
    v14 = 1;
  dateDescriptionLabelHour = self->_dateDescriptionLabelHour;
  if ((v14 & 1) != 0)
  {
    if (dateDescriptionLabelHour)
      goto LABEL_26;
    v16 = -[SUUICountdownView _newDateDescriptionLabel](self, "_newDateDescriptionLabel");
    v17 = self->_dateDescriptionLabelHour;
    self->_dateDescriptionLabelHour = v16;

    v18 = self->_dateDescriptionLabelHour;
    v19 = self->_clientContext;
    if (v19)
      -[SUUIClientContext localizedStringForKey:](v19, "localizedStringForKey:", CFSTR("COUNTDOWN_HOURS"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_HOURS"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v18, "setText:", v21);

    -[UILabel sizeToFit](self->_dateDescriptionLabelHour, "sizeToFit");
    -[SUUICountdownView addSubview:](self, "addSubview:", self->_dateDescriptionLabelHour);
  }
  else
  {
    if (!dateDescriptionLabelHour)
      goto LABEL_26;
    -[UILabel removeFromSuperview](dateDescriptionLabelHour, "removeFromSuperview");
    v20 = self->_dateDescriptionLabelHour;
    self->_dateDescriptionLabelHour = 0;

  }
  -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
LABEL_26:
  if (*((_QWORD *)&v40 + 1) | (unint64_t)v40 | v39)
    v22 = 1;
  else
    v22 = v5;
  dateDescriptionLabelMinute = self->_dateDescriptionLabelMinute;
  if ((v22 & 1) != 0)
  {
    if (dateDescriptionLabelMinute)
      goto LABEL_38;
    v24 = -[SUUICountdownView _newDateDescriptionLabel](self, "_newDateDescriptionLabel");
    v25 = self->_dateDescriptionLabelMinute;
    self->_dateDescriptionLabelMinute = v24;

    v26 = self->_dateDescriptionLabelMinute;
    v27 = self->_clientContext;
    if (v27)
      -[SUUIClientContext localizedStringForKey:](v27, "localizedStringForKey:", CFSTR("COUNTDOWN_MINUTES"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_MINUTES"), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v26, "setText:", v29);

    -[UILabel sizeToFit](self->_dateDescriptionLabelMinute, "sizeToFit");
    -[SUUICountdownView addSubview:](self, "addSubview:", self->_dateDescriptionLabelMinute);
  }
  else
  {
    if (!dateDescriptionLabelMinute)
      goto LABEL_38;
    -[UILabel removeFromSuperview](dateDescriptionLabelMinute, "removeFromSuperview");
    v28 = self->_dateDescriptionLabelMinute;
    self->_dateDescriptionLabelMinute = 0;

  }
  -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
LABEL_38:
  if (*((_QWORD *)&v40 + 1) | (unint64_t)v40 | v39 | v38)
    v30 = 1;
  else
    v30 = v5;
  dateDescriptionLabelSecond = self->_dateDescriptionLabelSecond;
  if ((v30 & 1) != 0)
  {
    if (dateDescriptionLabelSecond)
      return;
    v32 = -[SUUICountdownView _newDateDescriptionLabel](self, "_newDateDescriptionLabel");
    v33 = self->_dateDescriptionLabelSecond;
    self->_dateDescriptionLabelSecond = v32;

    v34 = self->_dateDescriptionLabelSecond;
    v35 = self->_clientContext;
    if (v35)
      -[SUUIClientContext localizedStringForKey:](v35, "localizedStringForKey:", CFSTR("COUNTDOWN_SECONDS"));
    else
      +[SUUIClientContext localizedStringForKey:inBundles:](SUUIClientContext, "localizedStringForKey:inBundles:", CFSTR("COUNTDOWN_SECONDS"), 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v34, "setText:", v37);

    -[UILabel sizeToFit](self->_dateDescriptionLabelSecond, "sizeToFit");
    -[SUUICountdownView addSubview:](self, "addSubview:", self->_dateDescriptionLabelSecond);
  }
  else
  {
    if (!dateDescriptionLabelSecond)
      return;
    -[UILabel removeFromSuperview](dateDescriptionLabelSecond, "removeFromSuperview");
    v36 = self->_dateDescriptionLabelSecond;
    self->_dateDescriptionLabelSecond = 0;

  }
  -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_reloadTime
{
  uint64_t v3;
  UILabel *dateLabelDay;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  uint64_t v9;
  UILabel *dateLabelHour;
  UILabel *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  uint64_t v15;
  UILabel *dateLabelMinute;
  UILabel *v17;
  UILabel *v18;
  UILabel *v19;
  void *v20;
  uint64_t v21;
  UILabel *dateLabelSecond;
  UILabel *v23;
  UILabel *v24;
  UILabel *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;

  v29 = 0uLL;
  v27 = 0;
  v28 = 0;
  -[SUUICountdownView _currentRemainingDays:hours:minutes:seconds:](self, "_currentRemainingDays:hours:minutes:seconds:", (char *)&v29 + 8, &v29, &v28, &v27);
  v3 = *((_QWORD *)&v29 + 1);
  dateLabelDay = self->_dateLabelDay;
  if (*((_QWORD *)&v29 + 1))
  {
    if (!dateLabelDay)
    {
      v5 = -[SUUICountdownView _newDateLabel](self, "_newDateLabel");
      v6 = self->_dateLabelDay;
      self->_dateLabelDay = v5;

      -[SUUICountdownView addSubview:](self, "addSubview:", self->_dateLabelDay);
      -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
      dateLabelDay = self->_dateLabelDay;
      v3 = *((_QWORD *)&v29 + 1);
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02ld"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](dateLabelDay, "setText:", v7);

  }
  else if (dateLabelDay)
  {
    -[UILabel removeFromSuperview](self->_dateLabelDay, "removeFromSuperview");
    v8 = self->_dateLabelDay;
    self->_dateLabelDay = 0;

    -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
  }
  v9 = v29;
  dateLabelHour = self->_dateLabelHour;
  if (v29 == 0)
  {
    if (dateLabelHour)
    {
      -[UILabel removeFromSuperview](self->_dateLabelHour, "removeFromSuperview");
      v14 = self->_dateLabelHour;
      self->_dateLabelHour = 0;

      -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    if (!dateLabelHour)
    {
      v11 = -[SUUICountdownView _newDateLabel](self, "_newDateLabel");
      v12 = self->_dateLabelHour;
      self->_dateLabelHour = v11;

      -[SUUICountdownView addSubview:](self, "addSubview:", self->_dateLabelHour);
      -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
      dateLabelHour = self->_dateLabelHour;
      v9 = v29;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02ld"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](dateLabelHour, "setText:", v13);

  }
  v15 = v28;
  dateLabelMinute = self->_dateLabelMinute;
  if (v29 != 0 || v28)
  {
    if (!dateLabelMinute)
    {
      v18 = -[SUUICountdownView _newDateLabel](self, "_newDateLabel");
      v19 = self->_dateLabelMinute;
      self->_dateLabelMinute = v18;

      -[SUUICountdownView addSubview:](self, "addSubview:", self->_dateLabelMinute);
      -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
      dateLabelMinute = self->_dateLabelMinute;
      v15 = v28;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02ld"), v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](dateLabelMinute, "setText:", v20);

  }
  else if (dateLabelMinute)
  {
    -[UILabel removeFromSuperview](self->_dateLabelMinute, "removeFromSuperview");
    v17 = self->_dateLabelMinute;
    self->_dateLabelMinute = 0;

    -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
  }
  v21 = v27;
  dateLabelSecond = self->_dateLabelSecond;
  if (v29 != 0 || v28 || v27)
  {
    if (!dateLabelSecond)
    {
      v24 = -[SUUICountdownView _newDateLabel](self, "_newDateLabel");
      v25 = self->_dateLabelSecond;
      self->_dateLabelSecond = v24;

      -[SUUICountdownView addSubview:](self, "addSubview:", self->_dateLabelSecond);
      -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
      dateLabelSecond = self->_dateLabelSecond;
      v21 = v27;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02ld"), v21);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](dateLabelSecond, "setText:", v26);

  }
  else if (dateLabelSecond)
  {
    -[UILabel removeFromSuperview](self->_dateLabelSecond, "removeFromSuperview");
    v23 = self->_dateLabelSecond;
    self->_dateLabelSecond = 0;

    -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_reloadTimeFlapped
{
  NSMutableArray *dateFlapLabels;
  NSMutableArray *v4;
  NSMutableArray *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v36 = 0;
  v37 = 0;
  v34 = 0;
  v35 = 0;
  -[SUUICountdownView _currentRemainingDays:hours:minutes:seconds:](self, "_currentRemainingDays:hours:minutes:seconds:", &v37, &v36, &v35, &v34);
  dateFlapLabels = self->_dateFlapLabels;
  if (!dateFlapLabels)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dateFlapLabels;
    self->_dateFlapLabels = v4;

    v6 = 4;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SUUICountdownView _newFlapLabelWithPosition:](self, "_newFlapLabelWithPosition:", 0);
      -[SUUICountdownView addSubview:](self, "addSubview:", v8);
      objc_msgSend(v7, "addObject:", v8);

      v9 = -[SUUICountdownView _newFlapLabelWithPosition:](self, "_newFlapLabelWithPosition:", 2);
      -[SUUICountdownView addSubview:](self, "addSubview:", v9);
      objc_msgSend(v7, "addObject:", v9);

      -[NSMutableArray addObject:](self->_dateFlapLabels, "addObject:", v7);
      --v6;
    }
    while (v6);
    dateFlapLabels = self->_dateFlapLabels;
  }
  -[NSMutableArray objectAtIndex:](dateFlapLabels, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v37 % 10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setString:", v12);

  -[NSMutableArray objectAtIndex:](self->_dateFlapLabels, "objectAtIndex:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v37 / 10 % 10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setString:", v15);

  -[NSMutableArray objectAtIndex:](self->_dateFlapLabels, "objectAtIndex:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndex:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v36 % 10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setString:", v18);

  -[NSMutableArray objectAtIndex:](self->_dateFlapLabels, "objectAtIndex:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndex:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v36 / 10 % 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setString:", v21);

  -[NSMutableArray objectAtIndex:](self->_dateFlapLabels, "objectAtIndex:", 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndex:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v35 % 10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setString:", v24);

  -[NSMutableArray objectAtIndex:](self->_dateFlapLabels, "objectAtIndex:", 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndex:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v35 / 10 % 10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setString:", v27);

  -[NSMutableArray objectAtIndex:](self->_dateFlapLabels, "objectAtIndex:", 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndex:", 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v34 % 10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setString:", v30);

  -[NSMutableArray objectAtIndex:](self->_dateFlapLabels, "objectAtIndex:", 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndex:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), v34 / 10 % 10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setString:", v33);

}

- (void)_reloadFontSizes
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  void *v24;
  double v25;
  double v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t n;
  void *v32;
  float v33;
  void *v34;
  UILabel *dateLabelDay;
  uint64_t v36;
  UILabel *dateLabelHour;
  void *v38;
  UILabel *dateLabelMinute;
  void *v40;
  UILabel *dateLabelSecond;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t ii;
  void *v48;
  void *v49;
  void *v50;
  float v51;
  void *v52;
  UILabel *dateDescriptionLabelDay;
  uint64_t v54;
  UILabel *dateDescriptionLabelHour;
  void *v56;
  UILabel *dateDescriptionLabelMinute;
  void *v58;
  UILabel *dateDescriptionLabelSecond;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t jj;
  void *v67;
  void *v68;
  float v69;
  void *v70;
  UILabel *numberLabel;
  float v72;
  void *v73;
  NSMutableArray *obj;
  NSMutableArray *obja;
  id objb;
  id objc;
  id v78;
  id v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _QWORD v111[4];
  _BYTE v112[128];
  _QWORD v113[4];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  if (self->_factor == 0.0 || !-[SUUICountdown isLoaded](self->_countdown, "isLoaded"))
    return;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  obj = self->_numberFlapLabels;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
  if (v3)
  {
    v4 = v3;
    v78 = *(id *)v107;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(id *)v107 != v78)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        v102 = 0u;
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v103;
          do
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v103 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
              objc_msgSend(v12, "sizeThatFits:", self->_factor * 14.0, self->_factor * 32.0);
              objc_msgSend(v12, "setFrame:", 0.0, 0.0, v13, v14);
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v102, v117, 16);
          }
          while (v9);
        }

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v106, v118, 16);
    }
    while (v4);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  obja = self->_dateFlapLabels;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
  if (v15)
  {
    v16 = v15;
    v79 = *(id *)v99;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(id *)v99 != v79)
          objc_enumerationMutation(obja);
        v18 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v94, v115, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v95;
          do
          {
            for (m = 0; m != v21; ++m)
            {
              if (*(_QWORD *)v95 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * m);
              objc_msgSend(v24, "sizeThatFits:", self->_factor * 14.0, self->_factor * 32.0);
              objc_msgSend(v24, "setFrame:", 0.0, 0.0, v25, v26);
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v94, v115, 16);
          }
          while (v21);
        }

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v98, v116, 16);
    }
    while (v16);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v27 = self->_numberSeparatorLabels;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v90, v114, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v91;
    do
    {
      for (n = 0; n != v29; ++n)
      {
        if (*(_QWORD *)v91 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * n);
        v33 = self->_factor * 24.0;
        objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("HelveticaNeue-CondensedBold"), roundf(v33));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setFont:", v34);

        objc_msgSend(v32, "sizeToFit");
      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v90, v114, 16);
    }
    while (v29);
  }

  dateLabelDay = self->_dateLabelDay;
  v36 = (uint64_t)dateLabelDay;
  if (!dateLabelDay)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v36 = objc_claimAutoreleasedReturnValue();
  }
  v80 = (id)v36;
  v113[0] = v36;
  dateLabelHour = self->_dateLabelHour;
  v38 = dateLabelHour;
  if (!dateLabelHour)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v113[1] = v38;
  dateLabelMinute = self->_dateLabelMinute;
  v40 = dateLabelMinute;
  if (!dateLabelMinute)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v113[2] = v40;
  dateLabelSecond = self->_dateLabelSecond;
  v42 = dateLabelSecond;
  if (!dateLabelSecond)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v113[3] = v42;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 4);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (dateLabelSecond)
  {
    if (dateLabelMinute)
      goto LABEL_48;
  }
  else
  {

    if (dateLabelMinute)
    {
LABEL_48:
      if (dateLabelHour)
        goto LABEL_49;
LABEL_85:

      if (dateLabelDay)
        goto LABEL_50;
      goto LABEL_86;
    }
  }

  if (!dateLabelHour)
    goto LABEL_85;
LABEL_49:
  if (dateLabelDay)
    goto LABEL_50;
LABEL_86:

LABEL_50:
  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v81 = v43;
  v44 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v86, v112, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v87;
    do
    {
      for (ii = 0; ii != v45; ++ii)
      {
        if (*(_QWORD *)v87 != v46)
          objc_enumerationMutation(v81);
        v48 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * ii);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v48 != v49)
        {
          objc_msgSend(v48, "text");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = self->_factor * 28.0;
          objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("HelveticaNeue-CondensedBold"), roundf(v51));
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setFont:", v52);

          objc_msgSend(v48, "setText:", CFSTR("00"));
          objc_msgSend(v48, "sizeToFit");
          objc_msgSend(v48, "frame");
          objc_msgSend(v48, "setFrame:");
          objc_msgSend(v48, "setText:", v50);

        }
      }
      v45 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v86, v112, 16);
    }
    while (v45);
  }

  dateDescriptionLabelDay = self->_dateDescriptionLabelDay;
  v54 = (uint64_t)dateDescriptionLabelDay;
  if (!dateDescriptionLabelDay)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v54 = objc_claimAutoreleasedReturnValue();
  }
  objb = (id)v54;
  v111[0] = v54;
  dateDescriptionLabelHour = self->_dateDescriptionLabelHour;
  v56 = dateDescriptionLabelHour;
  if (!dateDescriptionLabelHour)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v111[1] = v56;
  dateDescriptionLabelMinute = self->_dateDescriptionLabelMinute;
  v58 = dateDescriptionLabelMinute;
  if (!dateDescriptionLabelMinute)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v111[2] = v58;
  dateDescriptionLabelSecond = self->_dateDescriptionLabelSecond;
  v60 = dateDescriptionLabelSecond;
  if (!dateDescriptionLabelSecond)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v111[3] = v60;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v111, 4, objb);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (dateDescriptionLabelSecond)
  {
    if (dateDescriptionLabelMinute)
      goto LABEL_69;
LABEL_88:

    if (dateDescriptionLabelHour)
      goto LABEL_70;
LABEL_89:

    goto LABEL_70;
  }

  if (!dateDescriptionLabelMinute)
    goto LABEL_88;
LABEL_69:
  if (!dateDescriptionLabelHour)
    goto LABEL_89;
LABEL_70:
  if (!dateDescriptionLabelDay)

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v62 = v61;
  v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v82, v110, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v83;
    do
    {
      for (jj = 0; jj != v64; ++jj)
      {
        if (*(_QWORD *)v83 != v65)
          objc_enumerationMutation(v62);
        v67 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * jj);
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        if (v67 != v68)
        {
          v69 = self->_factor * 14.0;
          objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("HelveticaNeue-CondensedBold"), roundf(v69));
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "setFont:", v70);

          objc_msgSend(v67, "sizeToFit");
        }
      }
      v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v82, v110, 16);
    }
    while (v64);
  }

  numberLabel = self->_numberLabel;
  v72 = self->_factor * 28.0;
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", CFSTR("HelveticaNeue-CondensedBold"), roundf(v72));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](numberLabel, "setFont:", v73);

  -[SUUICountdownView setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)_currentValue
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  int64_t v8;
  int64_t v9;
  double v10;
  int64_t v11;

  v3 = (double)-[SUUICountdown initialValue](self->_countdown, "initialValue");
  -[SUUICountdown startDate](self->_countdown, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;
  v7 = (double)-[SUUICountdown rate](self->_countdown, "rate");
  v8 = -[SUUICountdown initialValue](self->_countdown, "initialValue");
  v9 = -[SUUICountdown finalValue](self->_countdown, "finalValue");
  v10 = -1.0;
  if (v8 < v9)
    v10 = 1.0;
  v11 = (uint64_t)(v3 + -(v6 * v7) * v10);

  if (v11 < 0)
    return 0;
  if (-[SUUICountdown finalValue](self->_countdown, "finalValue") < v11)
    return -[SUUICountdown finalValue](self->_countdown, "finalValue");
  return v11;
}

- (void)_currentRemainingDays:(int64_t *)a3 hours:(int64_t *)a4 minutes:(int64_t *)a5 seconds:(int64_t *)a6
{
  void *v10;
  double v11;
  double v12;
  double v13;

  -[SUUICountdown endDate](self->_countdown, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceNow");
  v12 = v11;

  v13 = 0.0;
  if (v12 >= 0.0)
    v13 = v12;
  if (a3)
    *a3 = (uint64_t)(v13 / 86400.0);
  if (a4)
    *a4 = (uint64_t)(v13 / 3600.0) % 24;
  if (a5)
    *a5 = (uint64_t)(v13 / 60.0) % 60;
  if (a6)
    *a6 = (uint64_t)v13 % 60;
}

- (void)_setCountdownWithResponse:(id)a3 error:(id)a4
{
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SUUICountdown updateWithDictionary:](self->_countdown, "updateWithDictionary:", v5);
    -[SUUICountdownView _reload](self, "_reload");
    -[SUUICountdownView _reloadFontSizes](self, "_reloadFontSizes");
    -[SUUICountdownView start](self, "start");
  }

}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (SUUICountdown)countdown
{
  return self->_countdown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_numberLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_numberSeparatorLabels, 0);
  objc_storeStrong((id *)&self->_numberFlapLabels, 0);
  objc_storeStrong((id *)&self->_dateFlapLabels, 0);
  objc_storeStrong((id *)&self->_dateLabelSecond, 0);
  objc_storeStrong((id *)&self->_dateLabelMinute, 0);
  objc_storeStrong((id *)&self->_dateLabelHour, 0);
  objc_storeStrong((id *)&self->_dateLabelDay, 0);
  objc_storeStrong((id *)&self->_dateDescriptionLabelSecond, 0);
  objc_storeStrong((id *)&self->_dateDescriptionLabelMinute, 0);
  objc_storeStrong((id *)&self->_dateDescriptionLabelHour, 0);
  objc_storeStrong((id *)&self->_dateDescriptionLabelDay, 0);
  objc_storeStrong((id *)&self->_timerTarget, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_countdown, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
