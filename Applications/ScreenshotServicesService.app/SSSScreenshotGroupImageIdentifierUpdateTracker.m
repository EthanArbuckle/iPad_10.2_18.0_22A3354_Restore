@implementation SSSScreenshotGroupImageIdentifierUpdateTracker

- (void)addScreenshotToGroup:(id)a3
{
  NSMutableArray *environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  void *v5;
  void *v6;

  environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates = self->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  ++self->_totalScreenshotsInGroup;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "environmentDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  -[NSMutableArray addObject:](environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates, "addObject:", v6);

  -[SSSScreenshotGroupImageIdentifierUpdateTracker _progressChanged](self, "_progressChanged");
}

- (void)screenshotReceivedImageIdentifierUpdate:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (v5)
    ++self->_totalValidScreenshotsInGroup;
  environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates = self->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environmentDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  -[NSMutableArray removeObject:](environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates, "removeObject:", v8);

  -[SSSScreenshotGroupImageIdentifierUpdateTracker _progressChanged](self, "_progressChanged");
  v10 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotGroupImageIdentifierUpdateTracker delegate](self, "delegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  objc_msgSend(v10, "groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier:", v9);
}

- (void)_progressChanged
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SSSScreenshotGroupImageIdentifierUpdateTracker delegate](self, "delegate"));
  objc_msgSend(v3, "groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates:", self);

}

- (double)progressTowardsReceivingAllImageIdentifierUpdates
{
  double totalScreenshotsInGroup;

  totalScreenshotsInGroup = (double)self->_totalScreenshotsInGroup;
  return (totalScreenshotsInGroup
        - (double)(unint64_t)-[NSMutableArray count](self->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates, "count"))/ totalScreenshotsInGroup;
}

- (BOOL)successful
{
  int64_t totalValidScreenshotsInGroup;
  int64_t totalScreenshotsInGroup;
  NSObject *v5;

  totalScreenshotsInGroup = self->_totalScreenshotsInGroup;
  totalValidScreenshotsInGroup = self->_totalValidScreenshotsInGroup;
  if (totalValidScreenshotsInGroup > totalScreenshotsInGroup)
  {
    v5 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100057F20(v5);

    totalScreenshotsInGroup = self->_totalScreenshotsInGroup;
    totalValidScreenshotsInGroup = self->_totalValidScreenshotsInGroup;
  }
  return totalValidScreenshotsInGroup >= totalScreenshotsInGroup;
}

- (SSSScreenshotGroupImageIdentifierUpdateTracker)init
{
  SSSScreenshotGroupImageIdentifierUpdateTracker *v2;
  uint64_t v3;
  NSMutableArray *environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSSScreenshotGroupImageIdentifierUpdateTracker;
  v2 = -[SSSScreenshotGroupImageIdentifierUpdateTracker init](&v6, "init");
  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates = v2->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates;
  v2->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates = (NSMutableArray *)v3;

  return v2;
}

- (SSSScreenshotGroupImageIdentifierUpdateTrackerDelegate)delegate
{
  return (SSSScreenshotGroupImageIdentifierUpdateTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_environmentDescriptionIdentifierForScreenshotsAwaitingImageIdentifierUpdates, 0);
}

@end
