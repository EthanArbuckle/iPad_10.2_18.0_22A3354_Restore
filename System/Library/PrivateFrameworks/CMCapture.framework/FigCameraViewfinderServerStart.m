@implementation FigCameraViewfinderServerStart

FigCameraViewfinderServer *__FigCameraViewfinderServerStart_block_invoke()
{
  FigCameraViewfinderServer *result;

  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work_cf();
  fig_note_initialize_category_with_default_work_cf();
  result = objc_alloc_init(FigCameraViewfinderServer);
  FigCameraViewfinderServerStart_serverSingleton = (uint64_t)result;
  return result;
}

@end
