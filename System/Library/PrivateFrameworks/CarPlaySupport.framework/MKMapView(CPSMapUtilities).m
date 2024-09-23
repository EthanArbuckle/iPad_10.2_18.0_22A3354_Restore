@implementation MKMapView(CPSMapUtilities)

- (void)_CPS_setCamera:()CPSMapUtilities animated:completionBlock:
{
  double v5;
  double v6;
  double v7;
  double v8;
  dispatch_time_t when;
  NSObject *queue;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18[2];
  id v19;
  char v20;
  id location[2];
  id v22;

  v22 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  v20 = a4 & 1;
  v19 = 0;
  objc_storeStrong(&v19, a5);
  if ((v20 & 1) != 0)
  {
    v18[1] = (id)0x3FED1EB851EB851FLL;
    LODWORD(v5) = 2.0;
    LODWORD(v6) = 1133903872;
    LODWORD(v7) = 1137180672;
    LODWORD(v8) = 0;
    objc_msgSend(v22, "setCamera:duration:springMass:springStiffness:springDamping:springVelocity:completionHandler:", location[0], &__block_literal_global_11, 0.91, v5, v6, v7, v8);
    when = dispatch_time(0, (uint64_t)(0.91 * 1000000000.0));
    queue = MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC760];
    v14 = -1073741824;
    v15 = 0;
    v16 = __70__MKMapView_CPSMapUtilities___CPS_setCamera_animated_completionBlock___block_invoke_2;
    v17 = &unk_24E270CE0;
    v18[0] = v19;
    dispatch_after(when, queue, &v13);

    objc_storeStrong(v18, 0);
  }
  else
  {
    objc_msgSend(v22, "setCamera:animated:", location[0], 0);
    if (v19)
      (*((void (**)(void))v19 + 2))();
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
}

@end
