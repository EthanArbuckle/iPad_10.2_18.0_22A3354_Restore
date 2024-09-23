@implementation ETMessage

+ (unsigned)messageType
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return -1;
}

- (unsigned)messageType
{
  return objc_msgSend((id)objc_opt_class(), "messageType");
}

- (ETMessage)init
{
  ETMessage *v2;
  uint64_t v3;
  UIColor *color;
  void *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ETMessage;
  v2 = -[ETMessage init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v3 = objc_claimAutoreleasedReturnValue();
    color = v2->_color;
    v2->_color = (UIColor *)v3;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v6;

    v2->_timeCreated = CFAbsoluteTimeGetCurrent();
  }
  return v2;
}

- (id)archiveData
{
  return 0;
}

+ (id)unarchive:(id)a3
{
  id v3;
  ETPHeader *v4;
  ETPHeader *v5;
  void *v6;
  uint64_t v7;
  __objc2_class *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  unsigned int v14;
  void *v15;
  _BOOL4 v16;
  double v17;
  _BOOL4 v18;
  double v19;
  uint64_t v20;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  uint8_t buf[4];
  _BYTE v26[18];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = -[ETPHeader initWithData:]([ETPHeader alloc], "initWithData:", v3);
  v5 = v4;
  if (v4 && -[ETPHeader hasMessageType](v4, "hasMessageType"))
  {
    -[ETPHeader messageData](v5, "messageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ETPHeader messageType](v5, "messageType");
    switch((int)v7)
    {
      case 1:
        v8 = ETTapMessage;
        goto LABEL_13;
      case 2:
        v8 = ETQuickTapMessage;
        goto LABEL_13;
      case 3:
        v8 = ETHeartbeatMessage;
        goto LABEL_13;
      case 4:
        v8 = ETSketchMessage;
        goto LABEL_13;
      case 5:
        v8 = ETReadReceiptMessage;
        goto LABEL_13;
      case 6:
        v8 = ETVideoMessage;
        goto LABEL_13;
      case 7:
        v8 = ETKissMessage;
        goto LABEL_13;
      case 8:
        v8 = ETAngerMessage;
LABEL_13:
        v9 = (void *)objc_msgSend([v8 alloc], "initWithArchiveData:", v6);
        break;
      default:
        v22 = v7;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v26 = v22;
            *(_WORD *)&v26[4] = 2112;
            *(_QWORD *)&v26[6] = v24;
            _os_log_impl(&dword_22C68B000, v23, OS_LOG_TYPE_INFO, "Unknown message type %du (%@)", buf, 0x12u);

          }
        }
        v9 = 0;
        break;
    }
    if (-[ETPHeader hasIdentifier](v5, "hasIdentifier"))
    {
      -[ETPHeader identifier](v5, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v10);
      v12 = v11 == 0;

      if (v12)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v26 = "+[ETMessage unarchive:]";
            *(_WORD *)&v26[8] = 2112;
            *(_QWORD *)&v26[10] = v10;
            _os_log_impl(&dword_22C68B000, v13, OS_LOG_TYPE_INFO, "%s: unarchived Digital Touch message header has a malformed identifier! (\"%@\")", buf, 0x16u);
          }

        }
      }
      else
      {
        objc_msgSend(v9, "setIdentifier:", v10);
      }

    }
    if (-[ETPHeader hasBaseColor](v5, "hasBaseColor"))
    {
      v14 = bswap32(-[ETPHeader baseColor](v5, "baseColor"));
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (double)v14 / 255.0, (double)BYTE1(v14) / 255.0, (double)BYTE2(v14) / 255.0, (double)HIBYTE(v14) / 255.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setColor:", v15);

    }
    else
    {
      objc_msgSend(v9, "setColor:", 0);
    }
    v16 = -[ETPHeader hasSendDate](v5, "hasSendDate");
    v17 = 0.0;
    if (v16)
      v17 = (double)-[ETPHeader sendDate](v5, "sendDate", 0.0) / 1000.0;
    objc_msgSend(v9, "setSendTime:", v17);
    v18 = -[ETPHeader hasStartDelay](v5, "hasStartDelay");
    v19 = 0.0;
    if (v18)
      -[ETPHeader startDelay](v5, "startDelay", 0.0);
    objc_msgSend(v9, "setStartDelay:", v19);
    if (-[ETPHeader hasSupportsPlaybackTimeOffsets](v5, "hasSupportsPlaybackTimeOffsets"))
      v20 = -[ETPHeader supportsPlaybackTimeOffsets](v5, "supportsPlaybackTimeOffsets");
    else
      v20 = 0;
    objc_msgSend(v9, "setSupportsPlaybackTimeOffset:", v20);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)archive
{
  ETPHeader *v3;
  unsigned int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  unsigned int v11;
  float v12;
  unsigned int v13;
  float v14;
  unsigned int v15;
  float v16;
  double v17;
  void *v18;
  double v20;
  double v21;
  double v22;
  _BYTE buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(ETPHeader);
  v4 = -[ETMessage messageType](self, "messageType");
  if (v4 < 0xB && ((0x7C7u >> v4) & 1) != 0)
  {
    -[ETPHeader setMessageType:](v3, "setMessageType:", dword_22C6BA960[(__int16)v4]);
    -[ETMessage color](self, "color");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[ETMessage color](self, "color");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0.0;
      *(_QWORD *)buf = 0;
      v20 = 0.0;
      v21 = 0.0;
      objc_msgSend(v9, "getRed:green:blue:alpha:", buf, &v22, &v21, &v20);
      v10 = *(double *)buf * 255.0;
      v11 = llroundf(v10);
      v12 = v22 * 255.0;
      v13 = llroundf(v12);
      v14 = v21 * 255.0;
      v15 = llroundf(v14);
      v16 = v20 * 255.0;
      -[ETPHeader setBaseColor:](v3, "setBaseColor:", bswap32((v15 << 16) | (llroundf(v16) << 24) | (v13 << 8) | v11));

    }
    -[ETMessage sendTime](self, "sendTime");
    -[ETPHeader setSendDate:](v3, "setSendDate:", (uint64_t)(v17 * 1000.0));
    -[ETMessage archiveData](self, "archiveData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ETPHeader setMessageData:](v3, "setMessageData:", v18);

    -[ETPHeader setIdentifier:](v3, "setIdentifier:", self->_identifier);
    -[ETPHeader setStartDelay:](v3, "setStartDelay:", self->_startDelay);
    -[ETPHeader setSupportsPlaybackTimeOffsets:](v3, "setSupportsPlaybackTimeOffsets:", self->_supportsPlaybackTimeOffset);
    -[ETPHeader data](v3, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        NSStringFromETMessageType(-[ETMessage messageType](self, "messageType"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_22C68B000, v5, OS_LOG_TYPE_INFO, "Cannot archive message of type %@", buf, 0xCu);

      }
    }
    v7 = 0;
  }

  return v7;
}

- (ETMessage)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ETMessage;
  return -[ETMessage init](&v4, sel_init, a3);
}

- (void)displayInScene:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id SKActionClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[3];
  _QWORD v34[4];

  v34[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = (uint64_t)&v24;
  v26 = 0x2020000000;
  v6 = getSKSetResourceBundleSymbolLoc_ptr;
  v27 = getSKSetResourceBundleSymbolLoc_ptr;
  if (!getSKSetResourceBundleSymbolLoc_ptr)
  {
    v7 = (void *)SpriteKitLibrary();
    v6 = dlsym(v7, "SKSetResourceBundle");
    *(_QWORD *)(v25 + 24) = v6;
    getSKSetResourceBundleSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v24, 8);
  if (!v6)
    -[ETMessage displayInScene:].cold.1();
  ((void (*)(id))v6)(v5);

  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v8 = (void *)getSKSpriteNodeClass_softClass;
  v32 = getSKSpriteNodeClass_softClass;
  v9 = MEMORY[0x24BDAC760];
  if (!getSKSpriteNodeClass_softClass)
  {
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = (uint64_t)__getSKSpriteNodeClass_block_invoke;
    v27 = &unk_24F6E6C30;
    v28 = &v29;
    __getSKSpriteNodeClass_block_invoke((uint64_t)&v24);
    v8 = (void *)v30[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v29, 8);
  objc_msgSend(v10, "spriteNodeWithImageNamed:", CFSTR("Dot"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColorBlendFactor:", 0.8);
  -[ETMessage color](self, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v12);

  objc_msgSend(v11, "setScale:", 0.0005);
  SKActionClass = getSKActionClass();
  objc_msgSend(getSKActionClass(), "scaleTo:duration:", 0.005, 1.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v14;
  objc_msgSend(getSKActionClass(), "fadeOutWithDuration:", 1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v34[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(SKActionClass, "group:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = getSKActionClass();
  v33[0] = v17;
  objc_msgSend(getSKActionClass(), "removeFromParent");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v19;
  v23[0] = v9;
  v23[1] = 3221225472;
  v23[2] = __28__ETMessage_displayInScene___block_invoke;
  v23[3] = &unk_24F6E6A98;
  v23[4] = self;
  objc_msgSend(getSKActionClass(), "runBlock:queue:", v23, MEMORY[0x24BDAC9B8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v20;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sequence:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "runAction:", v22);

  objc_msgSend(v4, "addChild:", v11);
}

uint64_t __28__ETMessage_displayInScene___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopPlaying");
}

- (id)messageTypeAsString
{
  return CFSTR("Unknown");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double timeCreated;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[ETMessage messageTypeAsString](self, "messageTypeAsString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_timeCreated);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  timeCreated = self->_timeCreated;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", self->_sendTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %p; messageType: %@, time created: %@ (%f), sendTime: %@ (%f), identifier: %@"),
    v4,
    self,
    v5,
    v6,
    *(_QWORD *)&timeCreated,
    v8,
    *(_QWORD *)&self->_sendTime,
    self->_identifier);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)sendTimeIsValid
{
  double v2;

  -[ETMessage sendTime](self, "sendTime");
  return v2 > 0.0;
}

- (BOOL)reachedSizeLimit
{
  return 0;
}

- (CGPoint)scenePointFromNormalizedPoint:(CGPoint)a3 inScene:(id)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a4, "size");
  v7 = x * v6;
  v9 = y * v8;
  result.y = v9;
  result.x = v7;
  return result;
}

- (void)stopPlaying
{
  ETMessageDelegate **p_delegate;
  id WeakRetained;
  id v5;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "messageWillStopPlaying:", self);

  v5 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v5, "messageDidStopPlaying:", self);

}

- (double)messageDuration
{
  return 0.0;
}

- (BOOL)shouldLoopDuringPlayback
{
  return 0;
}

- (void)wispChildren
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)-[NSMutableSet copy](self->_childrenDelayingWisp, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v8, "messageType", (_QWORD)v9) != 1)
          objc_msgSend(v8, "stopPlaying");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)childMessageDidCompleteWisp:(id)a3
{
  -[NSMutableSet removeObject:](self->_childrenDelayingWisp, "removeObject:", a3);
}

- (void)childMessageDidDelayWisp:(id)a3
{
  id v4;
  NSMutableSet *childrenDelayingWisp;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  childrenDelayingWisp = self->_childrenDelayingWisp;
  v8 = v4;
  if (!childrenDelayingWisp)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_childrenDelayingWisp;
    self->_childrenDelayingWisp = v6;

    v4 = v8;
    childrenDelayingWisp = self->_childrenDelayingWisp;
  }
  -[NSMutableSet addObject:](childrenDelayingWisp, "addObject:", v4);

}

- (BOOL)hasWispingChildren
{
  return -[NSMutableSet count](self->_childrenDelayingWisp, "count") != 0;
}

- (BOOL)isAnimated
{
  return 1;
}

- (unint64_t)messageVersion
{
  return self->_messageVersion;
}

- (double)timeCreated
{
  return self->_timeCreated;
}

- (void)setTimeCreated:(double)a3
{
  self->_timeCreated = a3;
}

- (double)sendTime
{
  return self->_sendTime;
}

- (void)setSendTime:(double)a3
{
  self->_sendTime = a3;
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void)setStartDelay:(double)a3
{
  self->_startDelay = a3;
}

- (BOOL)supportsPlaybackTimeOffset
{
  return self->_supportsPlaybackTimeOffset;
}

- (void)setSupportsPlaybackTimeOffset:(BOOL)a3
{
  self->_supportsPlaybackTimeOffset = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (BOOL)missedDuringPlayback
{
  return self->_missedDuringPlayback;
}

- (void)setMissedDuringPlayback:(BOOL)a3
{
  self->_missedDuringPlayback = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (BOOL)isRenderingOffscreen
{
  return self->_renderingOffscreen;
}

- (void)setRenderingOffscreen:(BOOL)a3
{
  self->_renderingOffscreen = a3;
}

- (BOOL)isRenderingOffscreenOpaque
{
  return self->_renderingOffscreenOpaque;
}

- (void)setRenderingOffscreenOpaque:(BOOL)a3
{
  self->_renderingOffscreenOpaque = a3;
}

- (ETMessageDelegate)delegate
{
  return (ETMessageDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ETMessageTimeSource)timeSource
{
  return (ETMessageTimeSource *)objc_loadWeakRetained((id *)&self->_timeSource);
}

- (void)setTimeSource:(id)a3
{
  objc_storeWeak((id *)&self->_timeSource, a3);
}

- (BOOL)delayWisp
{
  return self->_delayWisp;
}

- (void)setDelayWisp:(BOOL)a3
{
  self->_delayWisp = a3;
}

- (ETMessage)parentMessage
{
  return (ETMessage *)objc_loadWeakRetained((id *)&self->_parentMessage);
}

- (void)setParentMessage:(id)a3
{
  objc_storeWeak((id *)&self->_parentMessage, a3);
}

- (BOOL)mute
{
  return self->_mute;
}

- (void)setMute:(BOOL)a3
{
  self->_mute = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parentMessage);
  objc_destroyWeak((id *)&self->_timeSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_childrenDelayingWisp, 0);
}

- (void)displayInScene:.cold.1()
{
  dlerror();
  abort_report_np();
  __getSKSpriteNodeClass_block_invoke_cold_1();
}

@end
