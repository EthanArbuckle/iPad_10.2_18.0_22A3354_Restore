@implementation SNDSPGraph

- (SNDSPGraph)init
{
  void *v3;
  void *v4;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SNDSPGraph init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Do not call %@"), v4);

  return 0;
}

- (BOOL)preflight:(int64_t)a3 outputFrameCount:(int64_t *)a4 error:(id *)a5
{
  if (DSPGraph::Graph::numInputs((DSPGraph::Graph *)self->_graph.__ptr_) >= 2)
    __assert_rtn("-[SNDSPGraph preflight:outputFrameCount:error:]", "SNDSPGraph.mm", 255, "_graph->numInputs() <= 1");
  if (DSPGraph::Graph::numOutputs((DSPGraph::Graph *)self->_graph.__ptr_) >= 2)
    __assert_rtn("-[SNDSPGraph preflight:outputFrameCount:error:]", "SNDSPGraph.mm", 256, "_graph->numOutputs() <= 1");
  if (!a4)
    __assert_rtn("-[SNDSPGraph preflight:outputFrameCount:error:]", "SNDSPGraph.mm", 257, "outputFrameCount");
  DSPGraph::Graph::preflight();
  *a4 = 0;
  return 1;
}

- (BOOL)processInputBufferList:(AudioBufferList *)a3 inputFrameCount:(unsigned int)a4 atSourcePosition:(int64_t)a5 to:(AudioBufferList *)a6 outputFrameCapacity:(unsigned int)a7 outputFrameCount:(unsigned int *)a8 atDestinationPosition:(int64_t *)a9 error:(id *)a10
{
  if (DSPGraph::Graph::numInputs((DSPGraph::Graph *)self->_graph.__ptr_) >= 2)
    __assert_rtn("-[SNDSPGraph processInputBufferList:inputFrameCount:atSourcePosition:to:outputFrameCapacity:outputFrameCount:atDestinationPosition:error:]", "SNDSPGraph.mm", 309, "_graph->numInputs() <= 1");
  if (DSPGraph::Graph::numOutputs((DSPGraph::Graph *)self->_graph.__ptr_) >= 2)
    __assert_rtn("-[SNDSPGraph processInputBufferList:inputFrameCount:atSourcePosition:to:outputFrameCapacity:outputFrameCount:atDestinationPosition:error:]", "SNDSPGraph.mm", 310, "_graph->numOutputs() <= 1");
  if (!a9)
    __assert_rtn("-[SNDSPGraph processInputBufferList:inputFrameCount:atSourcePosition:to:outputFrameCapacity:outputFrameCount:atDestinationPosition:error:]", "SNDSPGraph.mm", 311, "destinationFramePosition");
  DSPGraph::Graph::processMultiple();
  *a8 = a7;
  *a9 = (uint64_t)0.0;
  return 1;
}

- (void).cxx_destruct
{
  sub_1D44DAAE4((uint64_t)&self->_graph);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
