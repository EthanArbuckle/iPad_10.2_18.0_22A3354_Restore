@implementation AMUIPosterPhotosAppearanceTransitionCoordinator

- (void)setPosterViewController:(id)a3 progress:(double)a4
{
  id v5;

  objc_msgSend(a3, "_posterViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpacity:forLayers:", 2, a4);

}

- (unint64_t)visibleSnapshotLayers
{
  return 3;
}

@end
