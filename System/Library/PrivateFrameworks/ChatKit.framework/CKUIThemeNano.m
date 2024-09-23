@implementation CKUIThemeNano

- (id)messagesControllerBackgroundColor
{
  if (messagesControllerBackgroundColor_once_1336 != -1)
    dispatch_once(&messagesControllerBackgroundColor_once_1336, &__block_literal_global_1337);
  return (id)messagesControllerBackgroundColor_sBehavior_1335;
}

void __50__CKUIThemeNano_messagesControllerBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messagesControllerBackgroundColor_sBehavior_1335;
  messagesControllerBackgroundColor_sBehavior_1335 = v0;

}

- (id)notificationSubtitleColor
{
  if (notificationSubtitleColor_once_1339 != -1)
    dispatch_once(&notificationSubtitleColor_once_1339, &__block_literal_global_1340);
  return (id)notificationSubtitleColor_sBehavior_1338;
}

void __42__CKUIThemeNano_notificationSubtitleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.298039216, 0.850980392, 0.392156863, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)notificationSubtitleColor_sBehavior_1338;
  notificationSubtitleColor_sBehavior_1338 = v0;

}

- (id)conversationListSenderColor
{
  if (conversationListSenderColor_once_1342 != -1)
    dispatch_once(&conversationListSenderColor_once_1342, &__block_literal_global_1343);
  return (id)conversationListSenderColor_sBehavior_1341;
}

void __44__CKUIThemeNano_conversationListSenderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListSenderColor_sBehavior_1341;
  conversationListSenderColor_sBehavior_1341 = v0;

}

- (id)conversationListSummaryColor
{
  if (conversationListSummaryColor_once != -1)
    dispatch_once(&conversationListSummaryColor_once, &__block_literal_global_1345);
  return (id)conversationListSummaryColor_sBehavior_1344;
}

void __45__CKUIThemeNano_conversationListSummaryColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.560784314, 0.560784314, 0.560784314, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListSummaryColor_sBehavior_1344;
  conversationListSummaryColor_sBehavior_1344 = v0;

}

- (id)conversationListDateColor
{
  if (conversationListDateColor_once != -1)
    dispatch_once(&conversationListDateColor_once, &__block_literal_global_1347);
  return (id)conversationListDateColor_sBehavior_1346;
}

void __42__CKUIThemeNano_conversationListDateColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.560784314, 0.560784314, 0.560784314, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListDateColor_sBehavior_1346;
  conversationListDateColor_sBehavior_1346 = v0;

}

- (id)conversationListGroupCountColor
{
  if (conversationListGroupCountColor_once_1349 != -1)
    dispatch_once(&conversationListGroupCountColor_once_1349, &__block_literal_global_1350);
  return (id)conversationListGroupCountColor_sBehavior_1348;
}

void __48__CKUIThemeNano_conversationListGroupCountColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.560784314, 0.560784314, 0.560784314, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)conversationListGroupCountColor_sBehavior_1348;
  conversationListGroupCountColor_sBehavior_1348 = v0;

}

- (id)progressBarTrackTintColor
{
  if (progressBarTrackTintColor_once_1352 != -1)
    dispatch_once(&progressBarTrackTintColor_once_1352, &__block_literal_global_1353);
  return (id)progressBarTrackTintColor_sBehavior_1351;
}

void __42__CKUIThemeNano_progressBarTrackTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.121568627, 0.121568627, 0.121568627, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)progressBarTrackTintColor_sBehavior_1351;
  progressBarTrackTintColor_sBehavior_1351 = v0;

}

- (id)transcriptNavBarTextColor
{
  if (transcriptNavBarTextColor_once != -1)
    dispatch_once(&transcriptNavBarTextColor_once, &__block_literal_global_1354);
  return (id)transcriptNavBarTextColor_sBehavior;
}

void __42__CKUIThemeNano_transcriptNavBarTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptNavBarTextColor_sBehavior;
  transcriptNavBarTextColor_sBehavior = v0;

}

- (id)blue_sendButtonColor
{
  if (blue_sendButtonColor_once != -1)
    dispatch_once(&blue_sendButtonColor_once, &__block_literal_global_1356);
  return (id)blue_sendButtonColor_sBehavior_1355;
}

void __37__CKUIThemeNano_blue_sendButtonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoDefaultBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)blue_sendButtonColor_sBehavior_1355;
  blue_sendButtonColor_sBehavior_1355 = v0;

}

- (id)transcriptBackgroundColor
{
  if (transcriptBackgroundColor_once != -1)
    dispatch_once(&transcriptBackgroundColor_once, &__block_literal_global_1359);
  return (id)transcriptBackgroundColor_sBehavior;
}

void __42__CKUIThemeNano_transcriptBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (CKIsRunningInCarousel())
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptBackgroundColor_sBehavior;
  transcriptBackgroundColor_sBehavior = v0;

}

- (id)transcriptTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CKUIThemeNano_transcriptTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (transcriptTextColor_once != -1)
    dispatch_once(&transcriptTextColor_once, block);
  return (id)transcriptTextColor_sBehavior;
}

void __36__CKUIThemeNano_transcriptTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusTextColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)transcriptTextColor_sBehavior;
  transcriptTextColor_sBehavior = v1;

}

- (id)transcriptBreadcrumpTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CKUIThemeNano_transcriptBreadcrumpTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (transcriptBreadcrumpTextColor_once_1361 != -1)
    dispatch_once(&transcriptBreadcrumpTextColor_once_1361, block);
  return (id)transcriptBreadcrumpTextColor_sBehavior_1360;
}

void __46__CKUIThemeNano_transcriptBreadcrumpTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "statusTextColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)transcriptBreadcrumpTextColor_sBehavior_1360;
  transcriptBreadcrumpTextColor_sBehavior_1360 = v1;

}

- (id)transcriptNicknameTextColor
{
  if (transcriptNicknameTextColor_once_1363 != -1)
    dispatch_once(&transcriptNicknameTextColor_once_1363, &__block_literal_global_1364);
  return (id)transcriptNicknameTextColor_sBehavior_1362;
}

void __44__CKUIThemeNano_transcriptNicknameTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoDefaultBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptNicknameTextColor_sBehavior_1362;
  transcriptNicknameTextColor_sBehavior_1362 = v0;

}

- (id)transcriptBigEmojiColor
{
  if (transcriptBigEmojiColor_once_1366 != -1)
    dispatch_once(&transcriptBigEmojiColor_once_1366, &__block_literal_global_1367);
  return (id)transcriptBigEmojiColor_sBehavior_1365;
}

void __40__CKUIThemeNano_transcriptBigEmojiColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptBigEmojiColor_sBehavior_1365;
  transcriptBigEmojiColor_sBehavior_1365 = v0;

}

- (id)transcriptDeemphasizedTextColor
{
  int v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;

  v3 = UIAccessibilityDarkerSystemColorsEnabled();
  v4 = (void *)transcriptDeemphasizedTextColor_sBehavior_1369;
  if (transcriptDeemphasizedTextColor_sBehavior_1369)
    v5 = transcriptDeemphasizedTextColor_sIsIncreaseContrastEnabled_transcriptDeemphasizedTextColor_1368 == v3;
  else
    v5 = 0;
  if (!v5)
  {
    -[CKUITheme grayTextColor](self, "grayTextColor");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)transcriptDeemphasizedTextColor_sBehavior_1369;
    transcriptDeemphasizedTextColor_sBehavior_1369 = v6;

    transcriptDeemphasizedTextColor_sIsIncreaseContrastEnabled_transcriptDeemphasizedTextColor_1368 = v3;
    v4 = (void *)transcriptDeemphasizedTextColor_sBehavior_1369;
  }
  return v4;
}

- (id)gray_balloonColors
{
  if (gray_balloonColors_once_1371 != -1)
    dispatch_once(&gray_balloonColors_once_1371, &__block_literal_global_1372);
  return (id)gray_balloonColors_sBehavior_1370;
}

void __35__CKUIThemeNano_gray_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoReplyGrayBalloonColor"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)gray_balloonColors_sBehavior_1370;
  gray_balloonColors_sBehavior_1370 = v1;

}

- (id)blue_balloonColors
{
  if (blue_balloonColors_once_1376 != -1)
    dispatch_once(&blue_balloonColors_once_1376, &__block_literal_global_1377);
  return (id)blue_balloonColors_sBehavior_1375;
}

void __35__CKUIThemeNano_blue_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.125490196, 0.580392157, 0.941176471, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)blue_balloonColors_sBehavior_1375;
  blue_balloonColors_sBehavior_1375 = v1;

}

- (id)gray_unfilledBalloonColor
{
  if (gray_unfilledBalloonColor_once_1379 != -1)
    dispatch_once(&gray_unfilledBalloonColor_once_1379, &__block_literal_global_1380);
  return (id)gray_unfilledBalloonColor_sBehavior_1378;
}

void __42__CKUIThemeNano_gray_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.301960784, 0.311764706, 0.331372549, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gray_unfilledBalloonColor_sBehavior_1378;
  gray_unfilledBalloonColor_sBehavior_1378 = v0;

}

- (id)background_balloonColors
{
  if (background_balloonColors_once_1382 != -1)
    dispatch_once(&background_balloonColors_once_1382, &__block_literal_global_1383);
  return (id)background_balloonColors_sBehavior_1381;
}

void __41__CKUIThemeNano_background_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoReplyGrayBalloonColor"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)background_balloonColors_sBehavior_1381;
  background_balloonColors_sBehavior_1381 = v1;

}

- (id)reply_gray_balloonColors
{
  if (reply_gray_balloonColors_once_1385 != -1)
    dispatch_once(&reply_gray_balloonColors_once_1385, &__block_literal_global_1386);
  return (id)reply_gray_balloonColors_sBehavior_1384;
}

void __41__CKUIThemeNano_reply_gray_balloonColors__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoReplyGrayBalloonColor"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();

  v2 = (void *)reply_gray_balloonColors_sBehavior_1384;
  reply_gray_balloonColors_sBehavior_1384 = v1;

}

- (id)reply_gray_unfilledBalloonColor
{
  if (reply_gray_unfilledBalloonColor_once_1388 != -1)
    dispatch_once(&reply_gray_unfilledBalloonColor_once_1388, &__block_literal_global_1389);
  return (id)reply_gray_unfilledBalloonColor_sBehavior_1387;
}

void __48__CKUIThemeNano_reply_gray_unfilledBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoReplyGrayUnfilledBalloonColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_unfilledBalloonColor_sBehavior_1387;
  reply_gray_unfilledBalloonColor_sBehavior_1387 = v0;

}

- (id)replyLineColor
{
  if (replyLineColor_once_1393 != -1)
    dispatch_once(&replyLineColor_once_1393, &__block_literal_global_1394);
  return (id)replyLineColor_sBehavior_1392;
}

void __31__CKUIThemeNano_replyLineColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoReplyLineColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)replyLineColor_sBehavior_1392;
  replyLineColor_sBehavior_1392 = v0;

}

- (id)transcriptReplyCountColor
{
  if (transcriptReplyCountColor_once != -1)
    dispatch_once(&transcriptReplyCountColor_once, &__block_literal_global_1397);
  return (id)transcriptReplyCountColor_sBehavior;
}

void __42__CKUIThemeNano_transcriptReplyCountColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoDefaultBlueColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptReplyCountColor_sBehavior;
  transcriptReplyCountColor_sBehavior = v0;

}

- (id)reply_gray_balloonTextColor
{
  if (reply_gray_balloonTextColor_once_1399 != -1)
    dispatch_once(&reply_gray_balloonTextColor_once_1399, &__block_literal_global_1400);
  return (id)reply_gray_balloonTextColor_sBehavior_1398;
}

void __44__CKUIThemeNano_reply_gray_balloonTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoReplyGrayTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_balloonTextColor_sBehavior_1398;
  reply_gray_balloonTextColor_sBehavior_1398 = v0;

}

- (id)reply_gray_balloonTextLinkColor
{
  if (reply_gray_balloonTextLinkColor_once_1404 != -1)
    dispatch_once(&reply_gray_balloonTextLinkColor_once_1404, &__block_literal_global_1405);
  return (id)reply_gray_balloonTextLinkColor_sBehavior_1403;
}

void __48__CKUIThemeNano_reply_gray_balloonTextLinkColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoReplyGrayTextColor"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)reply_gray_balloonTextLinkColor_sBehavior_1403;
  reply_gray_balloonTextLinkColor_sBehavior_1403 = v0;

}

- (UIColor)filledGrayBalloonColor
{
  if (filledGrayBalloonColor_once != -1)
    dispatch_once(&filledGrayBalloonColor_once, &__block_literal_global_1406);
  return (UIColor *)(id)filledGrayBalloonColor_sBehavior;
}

void __39__CKUIThemeNano_filledGrayBalloonColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "ckColorNamed:", CFSTR("CKNanoReplyGrayBalloonColorFilled"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)filledGrayBalloonColor_sBehavior;
  filledGrayBalloonColor_sBehavior = v0;

}

- (id)transcriptTypingIndicatorBubbleColor
{
  if (transcriptTypingIndicatorBubbleColor_once_1410 != -1)
    dispatch_once(&transcriptTypingIndicatorBubbleColor_once_1410, &__block_literal_global_1411);
  return (id)transcriptTypingIndicatorBubbleColor_sBehavior_1409;
}

void __53__CKUIThemeNano_transcriptTypingIndicatorBubbleColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.149019608, 0.149019608, 0.160784314, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptTypingIndicatorBubbleColor_sBehavior_1409;
  transcriptTypingIndicatorBubbleColor_sBehavior_1409 = v0;

}

- (id)transcriptTypingIndicatorDotColor
{
  if (transcriptTypingIndicatorDotColor_once_1413 != -1)
    dispatch_once(&transcriptTypingIndicatorDotColor_once_1413, &__block_literal_global_1414);
  return (id)transcriptTypingIndicatorDotColor_sBehavior_1412;
}

void __50__CKUIThemeNano_transcriptTypingIndicatorDotColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)transcriptTypingIndicatorDotColor_sBehavior_1412;
  transcriptTypingIndicatorDotColor_sBehavior_1412 = v0;

}

- (double)transcriptTypingIndicatorOpacity
{
  if (transcriptTypingIndicatorOpacity_once_1416 != -1)
    dispatch_once(&transcriptTypingIndicatorOpacity_once_1416, &__block_literal_global_1417);
  return *(double *)&transcriptTypingIndicatorOpacity_sBehavior_1415;
}

void __49__CKUIThemeNano_transcriptTypingIndicatorOpacity__block_invoke()
{
  transcriptTypingIndicatorOpacity_sBehavior_1415 = 0x3FF0000000000000;
}

- (id)attachmentBalloonTitleTextColor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__CKUIThemeNano_attachmentBalloonTitleTextColor__block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  if (attachmentBalloonTitleTextColor_once != -1)
    dispatch_once(&attachmentBalloonTitleTextColor_once, block);
  return (id)attachmentBalloonTitleTextColor_sBehavior_1418;
}

void __48__CKUIThemeNano_attachmentBalloonTitleTextColor__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "balloonTextColorForColorType:", 0xFFFFFFFFLL);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)attachmentBalloonTitleTextColor_sBehavior_1418;
  attachmentBalloonTitleTextColor_sBehavior_1418 = v1;

}

- (id)attachmentBalloonSubtitleTextColor
{
  if (attachmentBalloonSubtitleTextColor_once_1420 != -1)
    dispatch_once(&attachmentBalloonSubtitleTextColor_once_1420, &__block_literal_global_1421);
  return (id)attachmentBalloonSubtitleTextColor_sBehavior_1419;
}

void __51__CKUIThemeNano_attachmentBalloonSubtitleTextColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)attachmentBalloonSubtitleTextColor_sBehavior_1419;
  attachmentBalloonSubtitleTextColor_sBehavior_1419 = v0;

}

- (id)messageAcknowledgmentBalloonBorderColor
{
  if (messageAcknowledgmentBalloonBorderColor_once_1423 != -1)
    dispatch_once(&messageAcknowledgmentBalloonBorderColor_once_1423, &__block_literal_global_1424);
  return (id)messageAcknowledgmentBalloonBorderColor_sBehavior_1422;
}

void __56__CKUIThemeNano_messageAcknowledgmentBalloonBorderColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageAcknowledgmentBalloonBorderColor_sBehavior_1422;
  messageAcknowledgmentBalloonBorderColor_sBehavior_1422 = v0;

}

- (id)messageAcknowledgmentGrayColor
{
  if (messageAcknowledgmentGrayColor_once_1426 != -1)
    dispatch_once(&messageAcknowledgmentGrayColor_once_1426, &__block_literal_global_1427);
  return (id)messageAcknowledgmentGrayColor_sBehavior_1425;
}

void __47__CKUIThemeNano_messageAcknowledgmentGrayColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageAcknowledgmentGrayColor_sBehavior_1425;
  messageAcknowledgmentGrayColor_sBehavior_1425 = v0;

}

- (id)messageAcknowledgmentRedColor
{
  if (messageAcknowledgmentRedColor_once_1429 != -1)
    dispatch_once(&messageAcknowledgmentRedColor_once_1429, &__block_literal_global_1430);
  return (id)messageAcknowledgmentRedColor_sBehavior_1428;
}

void __46__CKUIThemeNano_messageAcknowledgmentRedColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.980392157, 0.368627451, 0.588235294, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageAcknowledgmentRedColor_sBehavior_1428;
  messageAcknowledgmentRedColor_sBehavior_1428 = v0;

}

- (id)messageAcknowledgmentWhiteColor
{
  if (messageAcknowledgmentWhiteColor_once_1432 != -1)
    dispatch_once(&messageAcknowledgmentWhiteColor_once_1432, &__block_literal_global_1433);
  return (id)messageAcknowledgmentWhiteColor_sBehavior_1431;
}

void __48__CKUIThemeNano_messageAcknowledgmentWhiteColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)messageAcknowledgmentWhiteColor_sBehavior_1431;
  messageAcknowledgmentWhiteColor_sBehavior_1431 = v0;

}

- (id)messageAcknowledgmentBalloonColorForStyle:(int64_t)a3
{
  void *v3;
  void *v4;

  -[CKUITheme balloonColorsForColorType:](self, "balloonColorsForColorType:", -[CKUITheme messageAcknowledgmentBalloonColorTypeForStyle:](self, "messageAcknowledgmentBalloonColorTypeForStyle:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)browserBackgroundColor
{
  if (browserBackgroundColor_once_1435 != -1)
    dispatch_once(&browserBackgroundColor_once_1435, &__block_literal_global_1436);
  return (id)browserBackgroundColor_sBehavior_1434;
}

void __39__CKUIThemeNano_browserBackgroundColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)browserBackgroundColor_sBehavior_1434;
  browserBackgroundColor_sBehavior_1434 = v0;

}

@end
