@implementation ADEspressoRunner

- (ADEspressoRunner)initWithPath:(id)a3 forEngine:(unint64_t)a4 configurationName:(id)a5
{
  id v8;
  id v9;
  ADEspressoRunner *v10;
  ADEspressoRunner *v11;
  ADEspressoRunnerProtocol *espressoRunner;
  ADEspressoRunnerV1 *v13;
  ADEspressoRunnerProtocol *v14;
  ADEspressoRunnerV2 *v15;
  ADEspressoRunnerProtocol *v16;
  ADEspressoRunner *v17;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ADEspressoRunner;
  v10 = -[ADEspressoRunner init](&v19, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_10;
  espressoRunner = v10->_espressoRunner;
  v10->_espressoRunner = 0;

  if (objc_msgSend(v8, "hasSuffix:", CFSTR(".espresso.net")))
  {
    v13 = -[ADEspressoRunnerV1 initWithPath:forEngine:configurationName:]([ADEspressoRunnerV1 alloc], "initWithPath:forEngine:configurationName:", v8, a4, v9);
    v14 = v11->_espressoRunner;
    v11->_espressoRunner = (ADEspressoRunnerProtocol *)v13;

  }
  else if (objc_msgSend(v8, "hasSuffix:", CFSTR(".bundle")))
  {
    v15 = -[ADEspressoRunnerV2 initWithPath:forEngine:configurationName:]([ADEspressoRunnerV2 alloc], "initWithPath:forEngine:configurationName:", v8, a4, v9);
    v16 = v11->_espressoRunner;
    v11->_espressoRunner = (ADEspressoRunnerProtocol *)v15;

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_error_impl(&dword_236382000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to initialize ADEspressoRunner. Model path extension is not .espresso.net/.bundle (%@)", buf, 0xCu);
  }
  if (v11->_espressoRunner)
    v17 = v11;
  else
LABEL_10:
    v17 = 0;

  return v17;
}

- (id)registerDescriptor:(id)a3
{
  -[ADEspressoRunnerProtocol registerDescriptor:](self->_espressoRunner, "registerDescriptor:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (__CVBuffer)createAndRegisterPixelBufferForDescriptor:(id)a3
{
  return (__CVBuffer *)-[ADEspressoRunnerProtocol createAndRegisterPixelBufferForDescriptor:](self->_espressoRunner, "createAndRegisterPixelBufferForDescriptor:", a3);
}

- (int64_t)registerIOSurface:(__IOSurface *)a3 forDescriptor:(id)a4
{
  return -[ADEspressoRunnerProtocol registerIOSurface:forDescriptor:](self->_espressoRunner, "registerIOSurface:forDescriptor:", a3, a4);
}

- (int64_t)registerPixelBuffer:(__CVBuffer *)a3 forDescriptor:(id)a4
{
  return -[ADEspressoRunnerProtocol registerPixelBuffer:forDescriptor:](self->_espressoRunner, "registerPixelBuffer:forDescriptor:", a3, a4);
}

- (int64_t)execute
{
  return -[ADEspressoRunnerProtocol execute](self->_espressoRunner, "execute");
}

- (int64_t)updateFeedbackLoopInputBuffer:(__CVBuffer *)a3 inputDescriptor:(id)a4 outputBuffer:(__CVBuffer *)a5 outputDescriptor:(id)a6
{
  return -[ADEspressoRunnerProtocol updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:](self->_espressoRunner, "updateFeedbackLoopInputBuffer:inputDescriptor:outputBuffer:outputDescriptor:", a3, a4, a5, a6);
}

- (id)networkVersionString
{
  return (id)-[ADEspressoRunnerProtocol networkVersionString](self->_espressoRunner, "networkVersionString");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_espressoRunner, 0);
}

@end
