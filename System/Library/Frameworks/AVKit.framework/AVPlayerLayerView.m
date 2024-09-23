@implementation AVPlayerLayerView

void __73____AVPlayerLayerView_startRoutingVideoToPictureInPicturePlayerLayerView__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 140.0, *MEMORY[0x1E0DC1450]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73____AVPlayerLayerView_startRoutingVideoToPictureInPicturePlayerLayerView__block_invoke_2;
  v3[3] = &unk_1E5BB0B58;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3870], "avkit_imageWithSymbolNamed:font:completion:", CFSTR("pip"), v2, v3);

}

void __73____AVPlayerLayerView_startRoutingVideoToPictureInPicturePlayerLayerView__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AVPictureInPictureIndicatorLayer *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  AVPictureInPictureIndicatorLayer *v17;
  id v18;

  v3 = (void *)MEMORY[0x1E0DC3658];
  v4 = a2;
  objc_msgSend(v3, "AV_indicatorForegroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_flatImageWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "playerLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = [AVPictureInPictureIndicatorLayer alloc];
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  v11 = v10;
  v18 = objc_retainAutorelease(v6);
  v12 = objc_msgSend(v18, "CGImage");
  objc_msgSend(*(id *)(a1 + 32), "videoBounds");
  v17 = -[AVPictureInPictureIndicatorLayer initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:](v8, "initWithDisplayScale:placeholderImage:opaque:videoRectWhenPIPBegan:", v12, 0, v11, v13, v14, v15, v16);
  objc_msgSend(v7, "setPlaceholderContentLayerDuringPIPMode:", v17);

}

@end
