@implementation MediaControlsRoutingViewController

- (id)_createVolumeSlider
{
  MediaControlsVolumeSlider *v2;

  v2 = [MediaControlsVolumeSlider alloc];
  return -[MPVolumeSlider initWithFrame:style:endpointRoute:outputDeviceRoute:](v2, "initWithFrame:style:endpointRoute:outputDeviceRoute:", 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end
