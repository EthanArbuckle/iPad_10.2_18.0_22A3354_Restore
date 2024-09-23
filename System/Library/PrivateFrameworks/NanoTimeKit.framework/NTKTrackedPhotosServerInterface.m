@implementation NTKTrackedPhotosServerInterface

void __NTKTrackedPhotosServerInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8EBD2A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKTrackedPhotosServerInterface_interface;
  NTKTrackedPhotosServerInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v5, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)NTKTrackedPhotosServerInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_fetchTrackedPhotosPriorityList_, 0, 1);
}

@end
