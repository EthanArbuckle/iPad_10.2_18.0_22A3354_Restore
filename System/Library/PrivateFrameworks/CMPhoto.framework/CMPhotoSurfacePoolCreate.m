@implementation CMPhotoSurfacePoolCreate

uint64_t __CMPhotoSurfacePoolCreate_block_invoke(uint64_t a1)
{
  return CMPhotoSurfacePoolHandleBackgroundNotification(*(_QWORD *)(a1 + 32));
}

@end
