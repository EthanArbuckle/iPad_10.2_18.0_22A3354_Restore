@implementation FBSSceneAction

- (FBSScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (FBSSerialQueue)callOutQueue
{
  return self->_callOutQueue;
}

- (void)setCallOutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callOutQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
