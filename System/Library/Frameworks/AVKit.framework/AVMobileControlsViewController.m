@implementation AVMobileControlsViewController

- (id)controlsViewControllerIfChromeless
{
  return 0;
}

- (id)controlsViewControllerIfChromed
{
  return 0;
}

- (void)setIncludedControls:(unint64_t)a3
{
  self->_includedControls = a3;
}

- (unint64_t)includedControls
{
  return self->_includedControls;
}

- (AVPlaybackSpeedCollection)playbackSpeedCollection
{
  return self->_playbackSpeedCollection;
}

- (unint64_t)excludedControls
{
  return self->_excludedControls;
}

- (void)setPlayerController:(id)a3
{
  objc_storeStrong((id *)&self->_playerController, a3);
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (AVVolumeController)volumeController
{
  return self->_volumeController;
}

- (AVMobileFullscreenController)fullscreenController
{
  return self->_fullscreenController;
}

- (AVPictureInPictureController)pipController
{
  return self->_pipController;
}

- (NSArray)transportBarCustomMenuItems
{
  return self->_transportBarCustomMenuItems;
}

- (void)addAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[AVMobileControlsViewController eventManager](self, "eventManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:withTarget:forEvent:", a3, v9, v8);

}

- (id)eventManager
{
  AVEventManager *eventManager;
  AVEventManager *v4;
  AVEventManager *v5;

  eventManager = self->_eventManager;
  if (!eventManager)
  {
    v4 = -[AVEventManager initWithOwner:]([AVEventManager alloc], "initWithOwner:", self);
    v5 = self->_eventManager;
    self->_eventManager = v4;

    eventManager = self->_eventManager;
  }
  return eventManager;
}

- (void)setPlaybackSpeedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_playbackSpeedCollection, a3);
}

- (void)setPipController:(id)a3
{
  objc_storeStrong((id *)&self->_pipController, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)secondaryPlaybackControlsType
{
  return self->_secondaryPlaybackControlsType;
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
}

- (void)setTransportBarCustomMenuItems:(id)a3
{
  NSArray *v4;
  NSArray *transportBarCustomMenuItems;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  transportBarCustomMenuItems = self->_transportBarCustomMenuItems;
  self->_transportBarCustomMenuItems = v4;

}

- (void)setRoutingConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_routingConfiguration, a3);
}

- (void)setControlItems:(id)a3
{
  NSArray *v4;
  NSArray *controlItems;

  if (self->_controlItems != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    controlItems = self->_controlItems;
    self->_controlItems = v4;

  }
}

- (void)setSecondaryPlaybackControlsType:(unint64_t)a3
{
  self->_secondaryPlaybackControlsType = a3;
}

- (BOOL)showsFullScreenControl
{
  return self->_showsFullScreenControl;
}

- (void)setShowsFullScreenControl:(BOOL)a3
{
  self->_showsFullScreenControl = a3;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (BOOL)optimizeForPerformance
{
  return self->_optimizeForPerformance;
}

- (void)setOptimizeForPerformance:(BOOL)a3
{
  self->_optimizeForPerformance = a3;
}

- (AVRoutingConfiguration)routingConfiguration
{
  return self->_routingConfiguration;
}

- (void)setFullscreenController:(id)a3
{
  objc_storeStrong((id *)&self->_fullscreenController, a3);
}

- (NSArray)controlItems
{
  return self->_controlItems;
}

- (AVMobileControlsViewController)init
{
  AVMobileControlsViewController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMobileControlsViewController;
  result = -[AVMobileControlsViewController init](&v3, sel_init);
  if (result)
  {
    result->_includedControls = 63;
    result->_visibileControls = 0;
    result->_visibilityPolicy = 1;
    result->_secondaryPlaybackControlsType = 0;
    result->_requiresLinearPlayback = 0;
  }
  return result;
}

- (unint64_t)visibilityPolicy
{
  return self->_visibilityPolicy;
}

- (void)setVisibilityPolicy:(unint64_t)a3
{
  self->_visibilityPolicy = a3;
}

- (void)addAction:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AVMobileControlsViewController eventManager](self, "eventManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:forEvent:", v7, v6);

}

- (void)removeAction:(SEL)a3 withTarget:(id)a4 forEvent:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  -[AVMobileControlsViewController eventManager](self, "eventManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAction:withTarget:forEvent:", a3, v9, v8);

}

- (AVMobileControlsViewControllerDelegate)delegate
{
  return (AVMobileControlsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setExcludedControls:(unint64_t)a3
{
  self->_excludedControls = a3;
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
}

- (unint64_t)visibileControls
{
  return self->_visibileControls;
}

- (void)setVisibileControls:(unint64_t)a3
{
  self->_visibileControls = a3;
}

- (AVKitLayoutItem)transportControlsLayoutItem
{
  return self->_transportControlsLayoutItem;
}

- (AVKitLayoutItem)volumeControlsLayoutItem
{
  return self->_volumeControlsLayoutItem;
}

- (AVKitLayoutItem)displayModeControlsLayoutItem
{
  return self->_displayModeControlsLayoutItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayModeControlsLayoutItem, 0);
  objc_storeStrong((id *)&self->_volumeControlsLayoutItem, 0);
  objc_storeStrong((id *)&self->_transportControlsLayoutItem, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_transportBarCustomMenuItems, 0);
  objc_storeStrong((id *)&self->_pipController, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_routingConfiguration, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_playbackSpeedCollection, 0);
  objc_storeStrong((id *)&self->_fullscreenController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventManager, 0);
}

+ (double)autoHideInterval
{
  return 3.0;
}

@end
