@implementation SSSStatisticsManager

+ (id)sharedStatisticsManager
{
  if (qword_1000AD778 != -1)
    dispatch_once(&qword_1000AD778, &stru_1000923D0);
  return (id)qword_1000AD770;
}

- (BOOL)_statisticsEnabled
{
  return 1;
}

- (void)screenshotGestureTriggered:(unint64_t)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100031358;
  v5[3] = &unk_1000923F8;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSStatisticsManager _triggerTypeForPresentationMode:](self, "_triggerTypeForPresentationMode:", a3));
  v4 = v6;
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("triggered"), v5);

}

- (void)screenshotGestureTriggeredWhileAnotherScreenshotWasShowing:(unint64_t)a3
{
  id v4;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100031460;
  v5[3] = &unk_1000923F8;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[SSSStatisticsManager _triggerTypeForPresentationMode:](self, "_triggerTypeForPresentationMode:", a3));
  v4 = v6;
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("triggered"), v5);

}

- (id)_triggerTypeForPresentationMode:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("keychord");
  if (a3 == 1)
    v3 = CFSTR("keyboard");
  if (a3 == 2)
    return CFSTR("pencil");
  else
    return (id)v3;
}

- (void)pipSlidOffscreenDueToTimeout
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("pip"), &stru_100092438);
}

- (void)pipDragEndedSuccessfully
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("pip"), &stru_100092458);
}

- (void)pipExpanded
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("pip"), &stru_100092478);
}

- (void)fullscreenExperienceHadCropEvent
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("fullscreen"), &stru_100092498);
}

- (void)didCropInNormalMode
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("crop"), &stru_1000924B8);
}

- (void)didCropInFullPageMode
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("crop"), &stru_1000924D8);
}

- (void)didAccidentallyDraw
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("edit"), &stru_1000924F8);
}

- (void)drewStrokes:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100031924;
  v3[3] = &unk_100092518;
  v3[4] = a3;
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("edit"), v3);
}

- (void)logTotalAnnotations:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100031A1C;
  v3[3] = &unk_100092518;
  v3[4] = a3;
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("edit"), v3);
}

- (void)didTapBetaFeedbackButton
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("beta_feedback_tapped"), &stru_100092538);
}

- (void)didSubmitFeedbackWithAnnotationCount:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100031BA0;
  v3[3] = &unk_100092518;
  v3[4] = a3;
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("beta_feedback_submitted"), v3);
}

- (void)didTapFullPageSegment
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("full_page_segmented_control"), &stru_100092558);
}

- (void)didChangeOpacityOnNormalScreenshot
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("opacity"), &stru_100092578);
}

- (void)didChangeOpacityOnFullPage
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("opacity"), &stru_100092598);
}

- (void)didShareScreenSingleScreenshots
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("share_action"), &stru_1000925B8);
}

- (void)didShareScreenMultipleScreenshots
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("share_action"), &stru_1000925D8);
}

- (void)didShareFullPageMixedScreenshots
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("share_action"), &stru_1000925F8);
}

- (void)didShareFullPageScreenshotAsAutomaticImage
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("share_action"), &stru_100092618);
}

- (void)didShareFullPageScreenshotAsAutomaticPDF
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("share_action"), &stru_100092638);
}

- (void)didShareFullPageScreenshotAsImage
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("share_action"), &stru_100092658);
}

- (void)didShareFullPageScreenshotAsPDF
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("share_action"), &stru_100092678);
}

- (void)didRenameScreenshot
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("share_action"), &stru_100092698);
}

- (void)didSaveImageToPhotos
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_1000926B8);
}

- (void)didSaveImageToFiles
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_1000926D8);
}

- (void)didSaveImageToQuickNote
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_1000926F8);
}

- (void)didSavePDFImageToPhotos
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_100092718);
}

- (void)didSaveFullPagePDFToFiles
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_100092738);
}

- (void)didSaveMixedToPhotosAndFiles
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_100092758);
}

- (void)didSaveMixedToQuickNoteAndFiles
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_100092778);
}

- (void)didSaveMixedAllToFiles
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_100092798);
}

- (void)didDeleteScreenshots
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_1000927B8);
}

- (void)didCopyDeleteScreenshots
{
  -[SSSStatisticsManager _sendEvent:block:](self, "_sendEvent:block:", CFSTR("done_action"), &stru_1000927D8);
}

- (void)_sendEvent:(id)a3 block:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (-[SSSStatisticsManager _statisticsEnabled](self, "_statisticsEnabled"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.screenshotservices.%@"), v8));
    AnalyticsSendEventLazy(v7, v6);

  }
}

@end
