@implementation HREMediaPauseAllContextActionTemplate

- (HREMediaPauseAllContextActionTemplate)init
{
  HREMediaPauseAllContextActionTemplate *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HREMediaPauseAllContextActionTemplate;
  v2 = -[HRETemplate init](&v6, sel_init);
  if (v2)
  {
    HRELocalizedString(CFSTR("HREContextActionNamePauseAll"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HREContextActionTemplate setContextActionName:](v2, "setContextActionName:", v3);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4D0B8]), "initWithSystemImageNamed:", CFSTR("tv.and.hifispeaker.fill"));
    -[HREContextActionTemplate setIconDescriptor:](v2, "setIconDescriptor:", v4);

    -[HRETemplate setIdentifier:](v2, "setIdentifier:", CFSTR("mediaPauseAllContextAction"));
    -[HRETemplate setSortingPriority:](v2, "setSortingPriority:", 4.0);
  }
  return v2;
}

- (id)_lazy_actionMap
{
  void *v2;
  void *v3;
  void *v4;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  HREMediaProfileContainerType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v2;
  +[HREMediaPlaybackActionMap actionMapWithState:volume:playbackArchive:](HREMediaPlaybackActionMap, "actionMapWithState:volume:playbackArchive:", 2, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
